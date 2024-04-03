
import Foundation
import UIKit

class CXC_MenuPresenter {
    
    let navigator: CXC_Navigator
    let realm: DataBaseManager
//    var topics: [ModsType] = []
    
    
    init(navigator: CXC_Navigator, realm: DataBaseManager) {
        self.navigator = navigator
        self.realm = realm
    }
    
//    func getTopics(completion: ()->()) {
//        let topics: [ModsType] = realm.getTopics()
//        self.topics = topics
//        completion()
//    }
}
