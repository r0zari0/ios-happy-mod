
import Foundation
import UIKit

class ModsDownloader {
    
    static let shared = ModsDownloader()
    
    private init() {}
    
    func downloadMods(for contentType: CXC_ContentType, completion: @escaping (Result<ModsModelCodable, Error>) -> Void) {
        guard let url = URL(string: "YOUR_BASE_URL" + contentType.downloadPath_CXC) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Server Error", code: -2, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -3, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let mods = try decoder.decode(ModsModelCodable.self, from: data)
                completion(.success(mods))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
//
//extension ModsDownloader {
//    private func download(vc: UIViewController) {
//        guard InternetManager.shared.checkInternetConnectivity() else {
//            CXC_Navigator.shared.showAlert(view: vc, text: "", alertType: .withButton)
//            return
//        }
//        
//        if
//            
//        if viewModel.item.apkPath != nil  {
//            guard let apkPath = viewModel.item.apkPath else {
//                return
//            }
//            
//            showNexusAlert()
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//                
//                self.viewModel.fetchIpaPanache(by: apkPath, id: self.viewModel.item.primaryKey ) { [weak self] url in
//                    self?.hideAlertCascade()
//                    
//                    guard ConnectionManagerIneffable.shared.isConnected else {
//                        self?.showQuiescentInternetAlert()
//                        return
//                    }
//                    
//                    guard let url = url else { return }
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//                        self?.showNexusAlert(with: "Successful download")
//                    })
//                    
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
//                        self?.hideAlertCascade()
//                        self?.shareAPKFileUsingActivityViewControllerMellifluous(apkFileURL: url)
//                    })
//                }
//            })
//        } else {
//            guard let data = viewModel.item.data else { return }
//            savePreviewImage_djhs(with: UIImage(data: data))
//        }
//    }
//    
//    private func shareAPKFileUsingActivityViewControllerMellifluous(apkFileURL: URL) {
//        
//        let fileManager = FileManager.default
//        
//        // Check if the file exists at the specified URL
//        if fileManager.fileExists(atPath: apkFileURL.path) {
//            
//            let activityViewController = UIActivityViewController(activityItems: [apkFileURL], applicationActivities: nil)
//            activityViewController.popoverPresentationController?.sourceView = self.view // Specify the source view
//            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
//            activityViewController.popoverPresentationController?.permittedArrowDirections = [] // Set the arrow directions
//            
//            // Completion handler for UIActivityViewController
//            activityViewController.completionWithItemsHandler = { activityType, completed, returnedItems, error in
//                if completed {
//                    // Check if activity type is 'saveToFiles' and handle accordingly
//                    if activityType == UIActivity.ActivityType(rawValue: "com.apple.CloudDocsUI.AddToiCloudDrive") {
//                        // Handle file saved to Files app
//                        print("File saved to Files app")
//                    }
//                } else if let error = error {
//                    // Handle error
//                    print("Error sharing file: \(error.localizedDescription)")
//                }
//            }
//            
//            DispatchQueue.main.async {
//                self.present(activityViewController, animated: true, completion: nil)
//            }
//            
//        } else {
//            print("File does not exist at the specified path.")
//            // Handle the error or investigate further
//        }
//    }
//
//}
