
import UIKit
import RealmSwift

enum ContentType: Int, CaseIterable {
    case apps
    case games
    case topics
    case favorites
    
    var name: String {
        switch self {
        case .apps: return "Art"
        case .games: return "Games"
        case .topics: return "Topics"
        case .favorites: return "Favorites"
        }
    }
    
    var path: String {
        switch self {
        case .apps: return "/Apps/content.json"
        case .games: return "/Games/content.json"
        case .topics: return "/Topics/topics.json"
        case .favorites: return ""
        }
    }
}

class LoadingVC_CXCViewController: UIViewController {
    
    @IBOutlet weak var laodingIndicator: UIActivityIndicatorView!
    
    let dropBox = CXC_Dropbox.shared
    let navigator = CXC_Navigator.shared
    let realmDB = DataBaseManager.shared
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = .white
        
        laodingIndicator.startAnimating()
        getAllData()
    }
}

extension LoadingVC_CXCViewController {
    
    func getAllData() {
        
        let dispatchGroup = DispatchGroup()
        let allTypes = ContentType.allCases.filter({ $0 != .favorites })
        
        allTypes.forEach { type in
            dispatchGroup.enter()
            getData(type: type) {
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self else { return }
            laodingIndicator.stopAnimating()
            navigator.showCXC_GamesListVC(view: self, dropBox: dropBox, screenType: .games)
        }
    }
    
    func getData(type: ContentType, completion: @escaping ()->()) {
        Task {
            do {
                let data = try await CXC_Dropbox().CXC_getData(forPath: type.path)
                
                if let result = try? JSONDecoder().decode(ModsModelCodable.self, from: data) {
                    realmDB.saveModsTypes(types: result.types, contentType: type)
                }
                
                completion()
            } catch {
                print("Error occurred: \(error)")
                completion()
            }
        }
    }
}
