
import Foundation
import UIKit

class CXC_GamesListPresenter {
    
    
    var mods: [ModsType] = []
    
    let screenType: ContentType
    let navigator: CXC_Navigator
    let realm: DataBaseManager
    
    init(navigator: CXC_Navigator, realm: DataBaseManager, secreenType: ContentType) {
        self.navigator = navigator
        self.realm = realm
        self.screenType = secreenType
    }
    
//    func receivedData(_ mods: [ModsType]) {
//        self.mods = mods
//    }
    
    func showMenu(vc: UIViewController) {
        var index = 0
        switch screenType {
        case .apps:
            index = 1
        case .games:
            index = 0
        case .topics:
            index = 2
        case .favorites:
            index = 3
        }
        
        navigator.showCXC_MenuVC(view: vc, selactedIndex: index)
    }
    
    func getAllMods(completion: @escaping ([ModsType]) -> Void) {
        switch screenType {
        case .apps:
            getApps {
                completion(self.mods)
            }
        case .games:
            getGames {
                completion(self.mods)
            }
        case .topics:
            getTopics {
                completion(self.mods)
            }
        default:
            completion([])
        }
    }
    
    func getGames(completion: ()->()) {
        let mods: [ModsType] = realm.getMods()
        self.mods = mods
        completion()
    }
    
    func getApps(completion: ()->()) {
        let apps: [ModsType] = realm.getApps()
           self.mods = apps
           completion()
       }
       
       func getTopics(completion: ()->()) {
           let topics: [ModsType] = realm.getTopics()
           self.mods = topics
           completion()
       }
}

extension CXC_GamesListPresenter {
    
    func showModsVC(view: UIViewController, mod: [ModsModel_CXC]) {
        navigator.showCXC_ModVC(view: view, screenType: screenType, mod: mod)
    }
}
