
import UIKit
import Foundation
import HYSLogger
import RealmSwift

class CXC_GamesListViewController: UIViewController {
    
    @IBOutlet weak var CXC_MenuButton: UIButton!
    
    @IBOutlet weak var CXC_GamesListTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let presenter: CXC_GamesListPresenter
    let dropBox = CXC_Dropbox.shared
    
    let cellIdentifier: String = String(describing: "CXC_GamesListTableViewCell")
    
    init(presenter: CXC_GamesListPresenter) {
        self.presenter = presenter
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

extension CXC_GamesListViewController: UITableViewDelegate, UITableViewDataSource, PremiumMainControllerDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedContent: [ModsModel_CXC] = []
        selectedContent = Array(presenter.mods[indexPath.row].mods)
        
        if isLocked(index: indexPath.row) {
            var productBuy: PremiumMainControllerStyle {
                switch presenter.screenType {
                case .apps:
                    return indexPath.row == 0 ? .unlockContentProduct : .unlockFuncProduct
                case .games:
                    return indexPath.row == 0 ? .unlockOther : .unlockFour
                case .topics:
                    return .unlockFive
                default: return .mainProduct
                }
            }
            showPremium(productBuy: productBuy)
        } else {
            presenter.showModsVC(view: self, mod: selectedContent)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter.mods.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CXC_GamesListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.config(content: presenter.mods[indexPath.row], isLocked: isLocked(index: indexPath.row))
        return cell
    }
    
    func premiumControllerDidDismiss() {
        CXC_GamesListTableView.reloadData()
    }
    
    private func showPremium(productBuy: PremiumMainControllerStyle) {
        let vc = PremiumMainController()
        vc.productBuy = productBuy
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    private func isLocked(index: Int) -> (Bool) {
        switch presenter.screenType {
        case .apps:
            switch index {
            case 0: return !IAPManager.shared.productBought.contains(.unlockContentProduct)
            case 1: return !IAPManager.shared.productBought.contains(.unlockFuncProduct)
            default: return false
            }
        case .games:
            switch index {
            case 0: return !IAPManager.shared.productBought.contains(.unlockOther)
            case 1: return !IAPManager.shared.productBought.contains(.unlockFour)
            default: return false
            }
        case .topics:
            switch index {
            case 0, 1, 2: return false
            default: return !IAPManager.shared.productBought.contains(.unlockFive)
            }
        default: return false
        }
    }
}
