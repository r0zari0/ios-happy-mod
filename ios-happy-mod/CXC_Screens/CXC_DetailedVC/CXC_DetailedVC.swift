
import UIKit

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
        getFilePath(content: presenter.content, contentType: presenter.screenType) { filePath in
                if let filePath = filePath {
                    print("🥓", filePath)
                    self.downloadFile(from: filePath) { success, destinationURL in
                        if success {
                            print("File downloaded successfully:", destinationURL)
                        } else {
                            print("🍟 Failed")
                        }
                    }
                } else {
                    print(String(describing: filePath))
                }
            }
    }
}

extension CXC_DetailedVC {
    
    func getFilePath(content: ModsModel_CXC, contentType: ContentType, completion: @escaping (String?) -> Void) {
        CXC_ModImage.showActivityIndicator()
        
        Task {
            do {
                let filePath = try await CXC_Dropbox.shared.getFilePath(contentType: contentType, filePath: content.filePath)
                DispatchQueue.main.async {
                    print("🌯", filePath)
                    completion(filePath)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                    print("🤕 Error fetching filePath:", error)
                }
            }
        }
    }
    
    func downloadFile(from url: String, completionHandler: @escaping (Bool, URL?) -> Void) {
        guard let fileURL = URL(string: url) else {
            print("Invalid file URL")
            completionHandler(false, nil)
            return
        }
        
        URLSession.shared.dataTask(with: fileURL) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to download file:", error ?? "Unknown error")
                completionHandler(false, nil)
                return
            }
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let destinationURL = documentsDirectory.appendingPathComponent(fileURL.lastPathComponent)
                
                do {
                    try data.write(to: destinationURL)
                    print("File downloaded successfully:", destinationURL)
                    completionHandler(true, destinationURL)
                } catch {
                    print("Failed to save file:", error)
                    completionHandler(false, nil)
                }
            }
        }.resume()
       }
}
