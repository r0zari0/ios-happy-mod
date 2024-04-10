
import UIKit
import Foundation
import SwiftyDropbox
import DataCache
import HYSLogger

struct DropBoxKeys_CXC {
    static let appkey = "e6qwmm07ls7lm34"
    static let appSecret = "nfyj53szsk3xp05"
    static let authCode = "czHFetFkAxAAAAAAAAAF40K2ibCzbuU3p41XueA8y¡0"
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
    static let refreshToken = "eoXWK3bwysMAAAAAAAAAAUHvdZU8bYd9SQHZ_h346VKa44hIcT2DZtPsDUbtgjye"
}


final class CXC_Dropbox : NSObject {
//    private var imageCache = NSCache<NSString, NSData>()

    static let shared = CXC_Dropbox()
    
    public var client : DropboxClient?
    private let userDefaults = UserDefaults.standard
    
    func CXC_init_Dropbox() {
        DropboxClientsManager.setupWithAppKey(DropBoxKeys_CXC.appkey)
        
        Task {
            do {
              let client = try await CXC_getAuthorizedClient()
                self.client = client
                Logger.debug("Success Authorized client")
            } catch {
                Logger.debug(error)
            }
        }
    }
    
//         func CXC_getRefreshToken() async {
//            do {
//                let refreshToken = try await CXC_getReshreshToken(authCode: DropBoxKeys_CXC.authCode)
//                let accessToken = try await CXC_getAccessToken(refreshToken: refreshToken)
//                client = DropboxClient(accessToken: accessToken)
//                print("good job first open token 🫡 \(accessToken),\(String(describing: client))")
//            } catch {
//                print("Error occurred: \(String(describing: error))")
//                Logger.error(error)
//            }
//        }
}

// MARK: - Async Await
extension CXC_Dropbox {
    
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                    completion(.success(image))
                } else {
                    completion(.failure(NSError(domain: "com.yourapp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load image"])))
                }
            }
        }
    
    func CXC_uploadJSONFile(filePath: String, from urlFrom: URL) async throws -> String? {
        let client = try await CXC_getAuthorizedClient()
        
        return try await CXC_upload(client: client, filePath: filePath, from: urlFrom)
    }
    
    func CXC_downloadModel<T: Codable>(filePath: String) async throws -> T {
        let json = try await CXC_downloadData(filePath: filePath)
        
        return try JSONDecoder().decode(T.self, from: json)
    }
    
    func CXC_downloadData(filePath: String) async throws -> Data {
        let client = try await CXC_getAuthorizedClient()
        
        return try await CXC_download(client: client, filePath: filePath)
    }
    
    func CXC_removeFolder(_ filePath: String) async throws {
        let client = try await CXC_getAuthorizedClient()
        
        client.files.deleteV2(path: filePath)
    }
    
    // MARK: - File download link
    func CXC_getFileDownloadLink(filePath: String) async throws -> URL? {
        
        let filePath = filePath.starts(with: "/") ? filePath : "/" + filePath
        let client = try await CXC_getAuthorizedClient()
        
        return try await CXC_getTemporaryLink(client: client, filePath: filePath)
    }
    
    func CXC_getData(forPath path: String) async throws -> Data {
        let path = path.starts(with: "/") ? path : "/" + path
        
        if let data = DataCache.instance.readData(forKey: path) {
            return data
        } else {
            let data = try await CXC_downloadData(filePath: path)
            DataCache.instance.write(data: data, forKey: path)
            return data
        }
    }
    
    func CXC_writeImageToCash(forPath path: String, image: UIImage) {
        let path = path.starts(with: "/") ? path : "/" + path
        
        if DataCache.instance.readData(forKey: path).isNil {
            DataCache.instance.write(image: image, forKey: path)
        }
    }
    
    func CXC_getImageFromCache(forPath path: String) -> UIImage? {
        return DataCache.instance.readImage(forKey: path)
    }
    
    func CXC_getMetaData(type: CXC_ContentType) async throws -> Bool {
        let client = try await CXC_getAuthorizedClient()
        
        return try await CXC_getMetaData(client: client, type: type)
    }
}

// MARK: - Convert sync to async
private extension CXC_Dropbox {
    
    // MARK: - Temporary Link
    func CXC_getTemporaryLink(client: DropboxClient, filePath: String) async throws -> URL? {
        try await withCheckedThrowingContinuation { continuation in
            self.CXC_getTemporaryLink(client: client, filePath: filePath) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }
    
    func CXC_getTemporaryLink(client: DropboxClient, filePath: String, completion: @escaping CXC_ValueClosure<Result<URL?, Error>>) {
        client.files.getTemporaryLink(path: filePath).response { response, error in
            if let result = response {
                completion(.success(URL(string: result.link)))
            } else if let error = error {
                completion(.failure(CXC_APIError.error("Error getting temporary link: \(error)")))
            }
        }
    }
    
    // MARK: - Download
    func CXC_download(client: DropboxClient, filePath: String) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            self.CXC_download(client: client, filePath: filePath) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }
    
    func CXC_download(client: DropboxClient, filePath: String, completion: @escaping CXC_ValueClosure<Result<Data, Error>>) {
        client.files.download(path: filePath).response { response, error in
            if let response {
                let data = response.1
                //                Logger.debug_CXC(data.prettyPrintedJSONString ?? "")
                completion(.success(data))
            } else if let error {
                completion(.failure(CXC_APIError.error("Error downloading JSON file for path: \(filePath), \nerror: \(error)")))
            }
        }
    }
    
    // MARK: - Upload
    func CXC_upload(client: DropboxClient, filePath: String, from urlFrom: URL) async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            self.CXC_upload(client: client, filePath: filePath, from: urlFrom) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }
    
    func CXC_upload(client: DropboxClient, filePath: String, from urlFrom: URL, completion: @escaping CXC_ValueClosure<Result<String,Error>>) {
        client.files.upload(path: filePath, mode: .overwrite, input: urlFrom).response { response, error in
            if let _ = response {
                return completion(.success("JSON file uploaded to Dropbox: \(filePath)"))
            } else if let error = error {
                return completion(.failure(CXC_APIError.error(error.description)))
            }
        }
    }
    
    // MARK: - MetaData
    func CXC_getMetaData(client: DropboxClient, type: CXC_ContentType) async throws -> Bool {
        try await withCheckedThrowingContinuation { continuation in
            self.CXC_getMetaData(client: client, type: type) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }
    
    func CXC_getMetaData(
        client: DropboxClient,
        type: CXC_ContentType,
        completion: @escaping CXC_ValueClosure<Result<Bool, Error>>
    ) {
        client.files.getMetadata(path: type.downloadPath_CXC).response(completionHandler: { data, error in
            if let data = data as? Files.FileMetadata {
                if data.size == self.userDefaults.integer(forKey: "bytes\(type.rawValue)") {
                    completion(.success(false))
                } else {
                    self.userDefaults.set(Int(data.size), forKey: "bytes\(type.rawValue)")
                    completion(.success(true))
                }
            } else if let error = error {
                completion(.failure(CXC_APIError.checkUpdateError(type: type, errorDescription: error.description)))
            } else {
                completion(.failure(CXC_APIError.error("unknownError")))
            }
        })
    }
}

// MARK: - Refresh & Access token & Authorize
private extension CXC_Dropbox {
    func CXC_getReshreshToken(authCode: String) async throws -> String {
        
        let username = DropBoxKeys_CXC.appkey
        let password = DropBoxKeys_CXC.appSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let parameters : Data = "code=\(authCode)&grant_type=authorization_code".data(using: .utf8)!
        let url = URL(string: DropBoxKeys_CXC.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        
        let (data, response) = try await URLSession.shared.data(for: apiRequest)
        
        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw CXC_APIError.unexpectedResponse
        }
        guard CXC_HTTPCodes.success.contains(code) else {
            if let errorRespose = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
               let error = errorRespose["error_description"]
            {
                Logger.error(error)
                throw CXC_APIError.error(error)
            }
            
            throw CXC_APIError.unexpectedResponse
        }
        
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        
        if let responseJSON = responseJSON as? [String: Any], let token = responseJSON["refresh_token"] as? String {
            return token
        }
        
        throw CXC_APIError.error("Access token error")
    }
    
    
    func CXC_getAccessToken(refreshToken: String) async throws -> String {
        let username = DropBoxKeys_CXC.appkey
        let password = DropBoxKeys_CXC.appSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let parameters : Data = "refresh_token=\(refreshToken)&grant_type=refresh_token".data(using: .utf8)!
        let url = URL(string: DropBoxKeys_CXC.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        
        let (data, response) = try await URLSession.shared.data(for: apiRequest)
        
        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw CXC_APIError.unexpectedResponse
        }
        guard CXC_HTTPCodes.success.contains(code) else {
            if let errorRespose = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
               let error = errorRespose["error_description"]
            {
                Logger.error(error)
                throw CXC_APIError.error(error)
            }
            
            throw CXC_APIError.unexpectedResponse
        }
        
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        
        if let responseJSON = responseJSON as? [String: Any], let token = responseJSON["access_token"] as? String {
            return token
        }
        
        throw CXC_APIError.error("Access token error")
    }
    
    @discardableResult
    func CXC_getAuthorizedClient() async throws -> DropboxClient {
        if let client {
            return client
        } else {
            let accessToken = try await CXC_getAccessToken(refreshToken: DropBoxKeys_CXC.refreshToken)
            
            if let client = client {
                return client
            } else {
                let client = DropboxClient(accessToken: accessToken)
                self.client = client
                
                return client
            }
        }
    }
}

// MARK: - fetchImage

extension CXC_Dropbox {
    func fetchImage(contentType: ContentType, imagePath: String) async throws -> UIImage? {
            let path = getImagePath(contentType: contentType, imagePath: imagePath)
            do {
                if let data = try await CXC_downloadDataWithCache(filePath: path) {
                    let image = UIImage(data: data)
                    return image
                } else {
                    return nil
                }
            } catch {
                print("Error downloading image:", error)
                return nil
            }
        }

    
    func CXC_downloadDataWithCache(filePath: String) async throws -> Data? {
            if let cachedData = DataCache.instance.readData(forKey: filePath) {
                return cachedData
            }
            let client = try await CXC_getAuthorizedClient()
            let data = try await CXC_download(client: client, filePath: filePath)
        
            DataCache.instance.write(data: data, forKey: filePath)
            
            return data
        }
    
    func getImagePath(contentType: ContentType, imagePath: String) -> String {
        switch contentType {
        case .apps:
            return "/Apps/\(imagePath)"
        case .games:
            return "/Games/\(imagePath)"
        case .topics:
            return "/Topics/\(imagePath)"
        default: return ""
        }
    }
    
//    func getFile_ZmLIV(client: DropboxClient,
//                       with path: String,
//                       completion: @escaping (Data?) -> Void) {
//        var dapEliminater_tGa: Bool {
//            let isliminated = false
//            return isliminated
//        }
//        
//        let client = client.files.download(path: path).response { response, error in
//            if let error {
//                print(String(describing: error))
//            }
//            completion(response?.1)
//        }
//    }
    
    func getPath_WRNMc(for contentType: ContentType, imgPath: String) -> String {
        var isLoggedInWithFacebook: Bool {
            let loggedIn = true
            return loggedIn
        }
        switch contentType {
            
        case .apps:
            return String(format: "/%@", imgPath)
        case .games:
            return String(format: "/%@", imgPath)
        case .topics:
            return String(format: "/%@", imgPath)
        case .favorites:
            return String(format: "/%@", imgPath)
        }
        
    }
}

extension CXC_Dropbox {
    func fetchFile(contentType: ContentType, filePath: String) async throws -> Data? {
        let path = getFilePath(contentType: contentType, filePath: filePath)
        do {
            if let data = try await downloadDataWithCache(filePath: path) {
                return data
            } else {
                return nil
            }
        } catch {
            print("Ошибка при загрузке файла:", error)
            return nil
        }
    }

    func downloadDataWithCache(filePath: String) async throws -> Data? {
        if let cachedData = DataCache.instance.readData(forKey: filePath) {
            return cachedData
        }
        let client = try await CXC_getAuthorizedClient()
        let data = try await CXC_download(client: client, filePath: filePath)

            DataCache.instance.write(data: data, forKey: filePath)
            return data
    }

    func getFilePath(contentType: ContentType, filePath: String) -> String {
        switch contentType {
        case .apps:
            return "/Apps/\(filePath)"
        case .games:
            return "/Games/\(filePath)"
        case .topics:
            return "/Topics/\(filePath)"
        default:
            return ""
        }
    }
}
