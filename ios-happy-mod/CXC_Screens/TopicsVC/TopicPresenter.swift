
import Foundation
import UIKit

class TopicPresenter {
    var topic: ModsModel_CXC
    
    let navigator: CXC_Navigator
    let screenType: ContentType
    let realm = DataBaseManager.shared
    let image: UIImageView
    
    
    init(navigator: CXC_Navigator,
         topic: ModsModel_CXC,
         screenType: ContentType,
         image: UIImageView) {
        self.navigator = navigator
        self.topic = topic
        self.screenType = screenType
        self.image = image
    }
    
    func setTopic(topic: ModsModel_CXC) {
        self.topic = topic
    }
}
