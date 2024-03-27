import Foundation
import RealmSwift
import Resolver
import HYSLogger

//class CXC_HomeDataAPI {
//    
//    @Injected private var dropBox: CXC_Dropbox
//    @Injected private var realm: Realm
//}
//
//// MARK: - API Methods
//extension CXC_HomeDataAPI {
//    func CXC_getModels(type: CXC_ContentType) async throws {
//        guard try await dropBox.CXC_getMetaData(type: type) else {
//            Logger.debug("\(type.rawValue) already getted")
//            return
//        }
//        
//        let json = try await dropBox.CXC_downloadData(filePath: type.downloadPath_CXC).ttls_json()
//        let models: [AppModel] = switch type {
//        case .apps, .games, .topics:
//            try getObjectsFromDict(json: json, type: type)
//        default: []
//        }
//        await saveModels(type: type, d    омвкыфЦЧПАМИЬ Юata: models)
//        
//        Logger.debug("\(type.rawValue) get success")
//    }
//}
//
//extension CXC_HomeDataAPI {
//    private func getObjectsFromDict(json: [String : Any], type: CXC_ContentType) throws -> [AppModel] {
//    }
//}
//
//// MARK: - CoreData methods
//extension CXC_HomeDataAPI {
//    private func saveModels(type: CXC_ContentType, data: [AppModel]) async {
//    }
//    
//    private func saveModels(type: CXC_ContentType, data: [AppModel]) async {
//    }
//}

