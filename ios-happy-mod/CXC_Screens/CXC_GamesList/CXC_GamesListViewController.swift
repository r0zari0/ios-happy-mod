
import UIKit
import Foundation
import HYSLogger
import RealmSwift

class CXC_GamesListViewController: UIViewController {
    
    @IBOutlet weak var CXC_MenuButton: UIButton!
    
    @IBOutlet weak var CXC_GamesListTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let presenter: CXC_GamesListPresenter
    let dropBox: CXC_Dropbox
    
    let cellIdentifier: String = String(describing: "CXC_GamesListTableViewCell")
    
    init(presenter: CXC_GamesListPresenter, dropBox: CXC_Dropbox) {
        self.presenter = presenter
        self.dropBox = dropBox
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCXC_GamesUI()
        setupMyCXC_TableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if presenter.screenType == .apps {
            presenter.getApps {
                titleLabel.text = "Apps"
                CXC_GamesListTableView.reloadData()
            }
        } else if presenter.screenType == .games {
            presenter.getGames {
                titleLabel.text = "Games"
                CXC_GamesListTableView.reloadData()
            }
        } else if presenter.screenType == .topics {
            presenter.getTopics {
                titleLabel.text = "Topics"
                CXC_GamesListTableView.reloadData()
            }
        }
        }
    
    func checkSubscriptions() {
        if IAPManager.shared.productBought.contains(.unlockContentProduct) {
            //someCode
        } else {
            //someCode
        }
        
        if IAPManager.shared.productBought.contains(.unlockFive) {
            //SomeCode
        } else {
            //someCode
        }
        
        if IAPManager.shared.productBought.contains(.unlockFour) {
            //someCode
        } else {
            //someCode
        }
        
        if IAPManager.shared.productBought.contains(.unlockFuncProduct) {
            //someCode
        } else {
            //somecode
        }
        
        if IAPManager.shared.productBought.contains(.mainProduct) {
            //someCode
        } else {
            //someCode
        }
        
        if IAPManager.shared.productBought.contains(.unlockOther) {
            //someCode
        } else {
            //someCode
        }
    }
    
    func setupCXC_GamesUI() {
        CXC_MenuButton.titleLabel?.textColor = .white
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func setupMyCXC_TableView() {
        CXC_GamesListTableView.showsVerticalScrollIndicator = false
        
        CXC_GamesListTableView.dataSource = self
        CXC_GamesListTableView.delegate = self
        CXC_GamesListTableView.register(.init(nibName: String(describing: cellIdentifier), bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    @IBAction func CXC_MenuActionButton() {
        
        presenter.showMenu(vc: self)
    }
}

extension CXC_GamesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedContent: [ModsModel_CXC] = []
        
         selectedContent = Array(presenter.mods[indexPath.row].mods)
        presenter.showModsVC(view: self, mod: selectedContent)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter.screenType == .topics {
            return 1
        } else {
            let count = presenter.mods.count
            return count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CXC_GamesListTableViewCell else {
            return UITableViewCell()
        }
        let mod = presenter.mods[indexPath.row]
        cell.config(content: mod)
        return cell
    }
}
