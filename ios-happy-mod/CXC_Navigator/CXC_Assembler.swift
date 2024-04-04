
import Foundation
import UIKit
import StoreKit

class CXC_Assembler {
    private let realm = DataBaseManager.shared

    func createCXC_Loading(navigator: CXC_Navigator, dropBox: CXC_Dropbox) -> UIViewController {
        let vc = LoadingVC_CXCViewController()
        
        return vc
    }
    
    func createTopicsVC(navigator: CXC_Navigator, presenter: ModsModel_CXC, screenType: ContentType) -> UIViewController {
        let presenter = TopicPresenter(navigator: navigator, topic: presenter, screenType: screenType)
        let vc = TopicsVC(presenter: presenter)
        return vc
    }
    
    func createCXC_GameList(navigator: CXC_Navigator, dropBox: CXC_Dropbox, screenType: ContentType) -> UIViewController {
        let presenter = CXC_GamesListPresenter(navigator: navigator, realm: realm, secreenType: screenType)
        let vc = CXC_GamesListViewController(presenter: presenter)
        
        return vc
    }
    
    func createModVC_CXC(navigator: CXC_Navigator,
                         dropBox: CXC_Dropbox,
                         screenType: ContentType,
                         mod: [ModsModel_CXC]) -> UIViewController {
        let presenter = CXC_ModsPresenter(navigator: navigator, secreenType: screenType)
        let vc = CXC_ModsVC(presenter: presenter, dropBox: dropBox)
        
        switch screenType {
        case .apps, .games, .topics:
            presenter.mods = mod.filter({ $0.contentType == screenType.rawValue })
        case .favorites:
            presenter.mods = realm.getFavorites()
        }
        return vc
    }
    
    func createDetailedVC_CXC(navigator: CXC_Navigator, realm: DataBaseManager, presenter: ModsModel_CXC, screenType: ContentType, image: UIImageView) -> UIViewController {
        let presenter = CXC_DetailedPresenter(navigator: navigator, content: presenter, screenType: screenType, image: image, realm: realm)
        let vc = CXC_DetailedVC(presenter: presenter)
        
        return vc
    }
    
    func createMenuVC_CXC(navigator: CXC_Navigator, dropBox: CXC_Dropbox, selectedIndex: Int) -> UIViewController {
        let presenter = CXC_MenuPresenter(navigator: navigator, realm: realm)
        let vc = CXC_MenuVC(presenter: presenter, dropBox: dropBox, selectedIndex: selectedIndex)
        
        return vc
    }
    
    func createPremiumMainController(productType: PremiumMainControllerStyle) -> UIViewController {
        let vc = PremiumMainController()
        vc.productBuy = productType
        return vc
    }
}
