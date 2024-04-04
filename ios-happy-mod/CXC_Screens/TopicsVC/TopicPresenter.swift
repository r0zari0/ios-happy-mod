
import Foundation

class TopicPresenter {
    
    var topic: ModsModel_CXC
    
    let topics: [String] = ["e", "w", "f", "f", "g"]
    
    let navigator: CXC_Navigator
    let screenType: ContentType
    let realm = DataBaseManager.shared
    
    init(navigator: CXC_Navigator,
         topic: ModsModel_CXC,
         screenType: ContentType) {
        self.navigator = navigator
        self.topic = topic
        self.screenType = screenType
    }
    
    func setTopic(_ content: ModsModel_CXC) {
        topic = content
    }
}
