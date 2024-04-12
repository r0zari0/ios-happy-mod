
import Foundation
import UIKit
import Photos

class CXC_DetailedPresenter {
    
    let navigator: CXC_Navigator
    let screenType: ContentType
    let image: UIImageView
    
    var content: ModsModel_CXC
    
    let realm: DataBaseManager
    
    init(navigator: CXC_Navigator,
         content: ModsModel_CXC,
         screenType: ContentType,
         image: UIImageView,
         realm:DataBaseManager) {
        self.content = content
        self.navigator = navigator
        self.screenType = screenType
        self.image = image
        self.realm = realm
    }
    
    func setContent(_ content: ModsModel_CXC) {
        self.content = content
    }
    
    func saveToFavorites() {
        realm.updateFavoriteStatus(mod: content, isFavorite: !content.isFavorite)
    }
}
