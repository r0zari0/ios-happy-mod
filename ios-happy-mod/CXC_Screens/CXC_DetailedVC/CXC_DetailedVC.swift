
import UIKit
import Photos

class CXC_DetailedVC: UIViewController {
    
    @IBOutlet weak var CXC_View: UIView!
    
    @IBOutlet weak var saveModButton: UIButton!
    @IBOutlet weak var CXC_BackButton: UIButton!
    
    @IBOutlet weak var CXC_DownloadButton: UIButton!
    @IBOutlet weak var CXC_ModImage: UIImageView!
    
    @IBOutlet weak var CXC_NameLabel: UILabel!
    @IBOutlet weak var CXC_TitleLabel: UILabel!
    
    @IBOutlet weak var CXC_TextView: UITextView!
    
    let presenter: CXC_DetailedPresenter
    
    init(presenter: CXC_DetailedPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyUI_CXC()
        presenter.setContent(presenter.content)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        saveModButton.reloadInputViews()
    }
    
    func setupMyUI_CXC() {
        CXC_View.layer.cornerRadius = 16
        CXC_ModImage.layer.cornerRadius = 16
        
        CXC_TextView.isEditable = false
        
        CXC_TitleLabel.text = "Mod"
        CXC_NameLabel.text = presenter.content.name
        CXC_TextView.text = presenter.content.modDescription
        CXC_ModImage.image = presenter.image.image
        
        if presenter.content.isFavorite == true {
            saveModButton.setImage(UIImage(named: "saved"), for: .normal)
        } else {
            saveModButton.setImage(UIImage(named: "empty"), for: .normal)
        }
        
    }
    
    @IBAction func saveModButtonAction(_ sender: Any) {
        presenter.saveToFavorites()
        
        if presenter.content.isFavorite == true {
            saveModButton.setImage(UIImage(named: "saved"), for: .normal)
        } else {
            saveModButton.setImage(UIImage(named: "empty"), for: .normal)
        }
    }
    
    @IBAction func CXC_BackButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func downloadActionButton(_ sender: Any) {
        downloadFile(filePath: presenter.content.filePath)
    }
    
    func downloadFile(filePath: String) {
        if presenter.content.filePath != "" {
            guard let path = presenter.content.filePath as String? else {
                return
            }
            guard InternetManager.shared.checkInternetConnectivity() else {
                CXC_Navigator.shared.showAlert(view: self, text: "no Internet", alertType: .withButton)
                return
            }
            
            let contentType = presenter.screenType // Получаем тип контента из презентера
            CXC_Navigator.shared.showAlert(view: self, text: "Loading...", alertType: .noButton)
            
            Task {
                do {
                    if let fileData = try await CXC_Dropbox.shared.fetchFile(contentType: contentType, filePath: filePath) {
                        // Обработка успешной загрузки файла
                        print("File downloaded successfully")
                        // Создаем URL для сохраненного файла
                        let temporaryDirectory = FileManager.default.temporaryDirectory
                        let fileName = "downloadedFile_\(presenter.content.name)"
                        let fileURL = temporaryDirectory.appendingPathComponent(fileName)
                        try? fileData.write(to: fileURL)
                        
                        // Закрываем алерт "Loading..."
                        CXC_Navigator.shared.dismissAlert()
                        
                        // Показываем алерт "Success"
                        CXC_Navigator.shared.showAlert(view: self, text: "Success", alertType: .noButton)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            // Закрываем алерт "Success" через 2 секунды
                            CXC_Navigator.shared.dismissAlert()
                            // Открываем UIActivityViewController для обмена файлом
                            self.shareFileUsingActivityViewController(fileURL: fileURL)
                        }
                    } else {
                        // Обработка случая, когда файл не удалось загрузить
                        CXC_Navigator.shared.showAlert(view: self, text: "Download unsuccessful!", alertType: .noButton)
                        // Закрываем алерт неудачи
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            CXC_Navigator.shared.dismissAlert()
                        }
                        print("Failed to download file")
                    }
                } catch {
                    // Обработка ошибки загрузки файла
                    CXC_Navigator.shared.showAlert(view: self, text: "Error downloading file: \(error.localizedDescription)", alertType: .noButton)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        CXC_Navigator.shared.dismissAlert()
                    }
                    print("Error downloading file:", error)
                }
            }
        } else {
            
            guard let data = presenter.content.image as String? else { return }
            downloadImage(imagePath: UIImage(named: data))
        }
        }

    private func shareFileUsingActivityViewController(fileURL: URL) {
        let fileManager = FileManager.default
        
        // Проверяем, существует ли файл по указанному URL
        guard fileManager.fileExists(atPath: fileURL.path) else {
            print("File does not exist at the specified path.")
            // Обрабатываем ошибку или исследуем дальше
            return
        }
        
        // Создаем UIActivityViewController для обмена файлом
        let activityViewController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // Указываем исходное представление
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        activityViewController.popoverPresentationController?.permittedArrowDirections = [] // Устанавливаем направления стрелок
        
        // Обработчик завершения для UIActivityViewController
        activityViewController.completionWithItemsHandler = { activityType, completed, returnedItems, error in
            if completed {
                // Проверяем, если тип действия - 'saveToFiles', и обрабатываем соответственно
                if activityType == UIActivity.ActivityType(rawValue: "com.apple.CloudDocsUI.AddToiCloudDrive") {
                    // Обрабатываем сохранение файла в приложении Files
                    print("File saved to Files app")
                }
            } else if let error = error {
                // Обрабатываем ошибку
                print("Error sharing file: \(error.localizedDescription)")
            }
        }
        
        // Представляем контроллер
        DispatchQueue.main.async {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
   }
extension CXC_DetailedVC {
    func downloadImage(imagePath: UIImage?) {
        guard InternetManager.shared.checkInternetConnectivity() else {
            CXC_Navigator.shared.showAlert(view: self, text: "no Internet", alertType: .withButton)
            return
        }
        
        let contentType = presenter.screenType // Получаем тип контента из презентера
        CXC_Navigator.shared.showAlert(view: self, text: "Loading...", alertType: .noButton)
        
        Task {
            do {
                if let imageData = try await CXC_Dropbox.shared.fetchImage(contentType: contentType, imagePath: presenter.content.image) {
                    // Обработка успешной загрузки изображения
                    print("Image downloaded successfully")
                    // Создаем URL для сохраненного файла
                    let temporaryDirectory = FileManager.default.temporaryDirectory
                    let fileURL = temporaryDirectory.appendingPathComponent("downloadedImage.jpg")
                    try? imageData.jpegData(compressionQuality: 1)?.write(to: fileURL)
                    
                    // Закрываем алерт "Loading..."
                    CXC_Navigator.shared.dismissAlert()
                    
                    // Показываем алерт "Success"
                    CXC_Navigator.shared.showAlert(view: self, text: "Success", alertType: .noButton)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        // Закрываем алерт "Success" через 2 секунды
                        CXC_Navigator.shared.dismissAlert()
                        // Открываем UIActivityViewController для обмена файлом
                        self.shareFileUsingActivityViewController(fileURL: fileURL)
                    }
                } else {
                    // Обработка случая, когда изображение не удалось загрузить
                    CXC_Navigator.shared.showAlert(view: self, text: "Download unsuccessful!", alertType: .noButton)
                    // Закрываем алерт неудачи
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        CXC_Navigator.shared.dismissAlert()
                    }
                    print("Failed to download image")
                }
            } catch {
                // Обработка ошибки загрузки изображения
                CXC_Navigator.shared.showAlert(view: self, text: "Error downloading image: \(error.localizedDescription)", alertType: .noButton)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    CXC_Navigator.shared.dismissAlert()
                }
                print("Error downloading image:", error)
            }
        }
    }
}
