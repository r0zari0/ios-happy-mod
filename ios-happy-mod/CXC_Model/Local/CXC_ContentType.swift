
import Foundation

enum CXC_ContentType: String, CaseIterable, Identifiable {
    
    var id: Self { self }
    case games = "Games"
    case apps = "Apps"
    case topics = "Topics"
    
    var downloadPath_CXC: String {
        switch self {
        case .topics: return "/Topics/topics.json"
        case .games: return "/Games/content.json"
        case .apps: return "/Apps/content.json"
        }
    }
}
