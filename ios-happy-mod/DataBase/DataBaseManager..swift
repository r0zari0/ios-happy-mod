
import RealmSwift
import Foundation

protocol IDataBaseManagerProtocol {
//    func saveMods(task: ModsModel_CXC)
    func updateFavoriteStatus(mod: ModsModel_CXC, isFavorite: Bool)
}

class DataBaseManager: IDataBaseManagerProtocol {
    
    static let shared = DataBaseManager()
    
    private let allTasks = Dynamic([ModsModel_CXC()])
    private let realm = try! Realm()
    
    private var results: Results<ModsModel_CXC>! {
        didSet {
            var resultTaskArray: [ModsModel_CXC] = []
            results.forEach { dbTask in
                resultTaskArray.append(dbTask)
            }
            allTasks.value = resultTaskArray
        }
    }
    
    func deleteMod(task: ModsModel_CXC) {
            let realm = try! Realm()
            do {
                try realm.write {
                    realm.delete(task)
                    print("🚫 Mod deleted:", task.name)
                }
            } catch {
                print("Error deleting apps model: (error.localizedDescription)")
            }
        }
    
    func saveModsTypes(types: [ModsType], contentType: ContentType) {
        let realm = try! Realm()
        do {
            try realm.write {
                let allMods = realm.objects(ModsModel_CXC.self)
                for type in types {
                    type.contentType = contentType.rawValue

                    for mod in type.mods {
                        mod.contentType = contentType.rawValue
                        mod.isFavorite = allMods.first(where: { $0.name == mod.name })?.isFavorite ?? false
                    }
                    
                    realm.add(type, update: .modified)
                }
            }
        } catch {
            print("Error saving mods types: \(error.localizedDescription)")
        }
    }
    
    func getMods() -> [ModsType] {
        let object = realm.objects(ModsType.self).toArray(ofType: ModsType.self)
        return object.filter({ $0.contentType == ContentType.games.rawValue })
    }
    
    func getApps() -> [ModsType] {
        let object = realm.objects(ModsType.self).toArray(ofType: ModsType.self)
        return object.filter({ $0.contentType == ContentType.apps.rawValue })
    }
    
    func getTopics() -> [ModsType] {
        let object = realm.objects(ModsType.self).toArray(ofType: ModsType.self)
        return object.filter({ $0.contentType == ContentType.topics.rawValue })
    }
    
    func getFavorites() -> [ModsModel_CXC] {
        let object = realm.objects(ModsModel_CXC.self).toArray(ofType: ModsModel_CXC.self)
        return object.filter({ $0.isFavorite })
    }
    
    func fetchRequestIfConsistElement(with label: String) -> Bool {
        let realm = try! Realm()
        
        let mod = realm.objects(ModsModel_CXC.self).filter("name == %@", label).first
        
        return mod != nil
    }
    
    func updateFavoriteStatus(mod: ModsModel_CXC, isFavorite: Bool) {
        do {
            try realm.write {
                mod.isFavorite = isFavorite
                print("✏️ Mod Updated", mod.name)
            }
        } catch {
            print("🤕", String(describing: error))
        }
    }
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}

