
import UIKit
import Foundation
import HYSLogger

class CXC_ModsVC: UIViewController {
    
    @IBOutlet weak var CXC_ModCollectionView: UICollectionView!
    
    @IBOutlet weak var CXC_titleLabel: UILabel!
    
    @IBOutlet weak var noTopicsLabel: UILabel!
    @IBOutlet weak var noResultsLabel: UILabel!
    @IBOutlet weak var noFavoritesLabel: UILabel!
    
    @IBOutlet weak var CXC_searchBar: UITextField!
    
    @IBOutlet weak var CXC_backButton: UIButton!
    
    @IBOutlet weak var CXC_showSearchButton: UIButton!
    
    let presenter: CXC_ModsPresenter
    let dropBox: CXC_Dropbox
    
    init(presenter: CXC_ModsPresenter, dropBox: CXC_Dropbox) {
        self.presenter = presenter
        self.dropBox = dropBox
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI_CXC()
        
        CXC_titleLabel.text = presenter.screenType.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CXC_ModCollectionView.reloadData()
    }
    
    func setupUI_CXC() {
        setupCollectionView_CXC()
        setupSearchBar_CXC()
        updateLabelsVisibility()
    }
    
    func setupCollectionView_CXC() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        CXC_ModCollectionView.collectionViewLayout = layout
        CXC_ModCollectionView.showsVerticalScrollIndicator = false
        
        CXC_ModCollectionView.delegate = self
        CXC_ModCollectionView.dataSource = self
        CXC_ModCollectionView.register(.init(nibName: String(describing: CXC_ModCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CXC_ModCell.self))
        CXC_ModCollectionView.reloadData()
    }
    
    
    // MARK: - Actions
    
    @IBAction func CXC_showSearchButtonAction(_ sender: Any) {
        CXC_searchBar.text = ""
        if CXC_searchBar.isHidden {
            CXC_backButton.isHidden = true
            CXC_titleLabel.isHidden = true
            CXC_searchBar.isHidden = false
            CXC_showSearchButton.setImage(UIImage(named: "x"), for: .normal)
        } else {
            CXC_titleLabel.isHidden = false
            CXC_backButton.isHidden = false
            CXC_searchBar.isHidden = true
            CXC_showSearchButton.setImage(UIImage(named: "search"), for: .normal)
        }
    }
    
    //MARK: - Search
    
    @IBAction func CXC_backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func textFieldSearchAction(_ sender: UITextField) {
    }
}

//MARK: - CollectioView

extension CXC_ModsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = filterContentForSearchText(CXC_searchBar.text ?? "").count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CXC_ModCell.self), for: indexPath) as? CXC_ModCell else {
            return UICollectionViewCell()
        }
        
        let item = filterContentForSearchText(CXC_searchBar.text ?? "")[indexPath.row]
        
        cell.config(content: item)
        
        let contentType = ContentType(rawValue: item.contentType) ?? .games
        cell.getImage(content: item, contentType: contentType)
        
        cell.openButtonActionClosure = { [weak self] in
            guard let self, let index = self.presenter.mods.firstIndex(where: { $0 === item }) else {
                return
            }
            self.presenter.showDetaildVC(view: self,
                                         indexPath: index,
                                         screenType: self.presenter.screenType,
                                         presenter: item,
                                         image: cell.CXC_ModImage)
        }
        
        cell.saveButtonActionClosure = { [ weak self] in
            self?.updateFavoriteButton(for: item)
            self?.presenter.checkForUpdates {
                self?.CXC_ModCollectionView.reloadData()
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 316)
    }
}

//MARK: - SearchBar

extension CXC_ModsVC: UITextFieldDelegate {
    func setupSearchBar_CXC() {
        CXC_searchBar.delegate = self
        
        CXC_searchBar.backgroundColor = .myGreen
        CXC_searchBar.layer.cornerRadius = 16
        CXC_searchBar.layer.masksToBounds = true
        
        CXC_searchBar.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        leftView.backgroundColor = .clear
        
        let leftImage = UIImageView(image: UIImage(named: "search"))
        
        leftImage.contentMode = .scaleAspectFit
        leftImage.frame = CGRect(x: 12, y: 4, width: 24, height: 24)
        leftView.addSubview(leftImage)
        
        CXC_searchBar.leftViewMode = .always
        CXC_searchBar.leftView = leftView
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        CXC_ModCollectionView.reloadData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let searchText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else {
            return true
        }
        return true
    }
    
    func filteSearchText_CXC(_ searchText: String) {
        guard !searchText.isEmpty else {
            CXC_ModCollectionView.reloadData()
            return
        }
        CXC_ModCollectionView.reloadData()
    }
    
    func filterContentForSearchText(_ searchText: String) -> [ModsModel_CXC] {
        let filteredMods: [ModsModel_CXC]
        if !searchText.isEmpty {
            filteredMods = presenter.mods.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            if filteredMods.isEmpty {
                noResultsLabel.isHidden = false
                CXC_ModCollectionView.isHidden = true
            } else {
                noResultsLabel.isHidden = true
                CXC_ModCollectionView.isHidden = false
            }
        } else {
            filteredMods = presenter.mods
            noResultsLabel.isHidden = true
            CXC_ModCollectionView.isHidden = false
        }
        return filteredMods
    }
}


extension CXC_ModsVC {
    func updateFavoriteButton(for mod: ModsModel_CXC) {
//            guard let index = presenter.mods.firstIndex(where: { $0.name == mod.name }), let cell = getCell(for: index) else {
//                return
//            }
        guard let index = presenter.mods.firstIndex(where: { $0.name == mod.name }) else {
            return
        }
            presenter.saveToFavorites(mod: mod)
        
        if presenter.screenType == .favorites {
            presenter.mods.remove(at: index)
            CXC_ModCollectionView.reloadData()
            updateLabelsVisibility()
        } else {
            guard let cell = getCell(for: index) else {
                return
            }
            cell.config(content: mod)
        }
        }
    
    func getCell(for index: Int) -> CXC_ModCell? {
        let indexPath = IndexPath(item: index, section: 0)
        guard let cell = CXC_ModCollectionView.cellForItem(at: indexPath) as? CXC_ModCell else {
            return nil
        }
        
        return cell
    }
}

extension CXC_ModsVC {
    func updateLabelsVisibility() {
        if presenter.screenType == .topics {
            noResultsLabel.isHidden = true
            noFavoritesLabel.isHidden = true
            if presenter.mods.isEmpty {
                noTopicsLabel.isHidden = false
                CXC_ModCollectionView.isHidden = true
            } else {
                noTopicsLabel.isHidden = true
                CXC_ModCollectionView.isHidden = false
            }
        } else if presenter.screenType == .favorites {
            if presenter.mods.isEmpty {
                noFavoritesLabel.isHidden = false
                CXC_ModCollectionView.isHidden = true
            } else {
                noFavoritesLabel.isHidden = true
                CXC_ModCollectionView.isHidden = false
            }
            noTopicsLabel.isHidden = true
            noResultsLabel.isHidden = true
        } else {
            noTopicsLabel.isHidden = true
            noFavoritesLabel.isHidden = true
            if presenter.mods.isEmpty {
                noResultsLabel.isHidden = false
                CXC_ModCollectionView.isHidden = true
            } else {
                noResultsLabel.isHidden = true
                CXC_ModCollectionView.isHidden = false
            }
        }
    }
}
