
import Foundation
import UIKit
import RealmSwift

class CXC_ModsPresenter {
    var mods: [ModsModel_CXC] = []
    
    let modsType = CXC_ContentType.allCases
    
    let screenType: ContentType
    let navigator: CXC_Navigator
    let realm: DataBaseManager
    
    init(navigator: CXC_Navigator, realm: DataBaseManager, secreenType: ContentType) {
        self.navigator = navigator
        self.realm = realm
        self.screenType = secreenType
    }
    
    func checkForUpdates(complition: () -> ()) {
        if screenType == .favorites {
            mods = mods.filter { $0.isFavorite }
        }
    }
    
    func saveToFavorites(mod: ModsModel_CXC) {
        realm.updateFavoriteStatus(mod: mod, isFavorite: !mod.isFavorite)
    }
    
    func receivedData(_ mods: [ModsModel_CXC]) {
        self.mods = mods
    }
    
    func showMenu(vc: UIViewController) {
        navigator.showCXC_MenuVC(view: vc, selactedIndex: 0)
    }
    
    func showDetaildVC(view: UIViewController, indexPath: Int, screenType: ContentType, presenter: ModsModel_CXC, image: UIImageView) {
//        modsType[indexPath]
        
        navigator.showCXC_DetailedVC(view: view, screenType: screenType, presenter: presenter, image: image, realm: realm)
    }
}
