
import UIKit
import Kingfisher

class CXC_ModCell: UICollectionViewCell {
    @IBOutlet weak var CXC_CellView: UIView!
    
    @IBOutlet weak var CXC_ModImage: UIImageView!
    
    @IBOutlet weak var CXC_ModNameLabel: UILabel!
    @IBOutlet weak var CXC_ModВescriptionLabel: UILabel!
    
    @IBOutlet weak var CXC_SaveButton: UIButton!
    @IBOutlet weak var CXC_OpenButton: UIButton!
    
    var openButtonActionClosure: (() -> Void)?
    var saveButtonActionClosure: (() -> Void)?
    
    let dropBox: CXC_Dropbox = CXC_Dropbox()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMyUI_CXC()
        
//        CXC_ModImage.image = UIImage(named: "placeholder_image")
    }
    
    func setupMyUI_CXC() {
        CXC_CellView.layer.cornerRadius = 16
        CXC_ModImage.layer.cornerRadius = 14
    }
    //MARK: -
    
    override func prepareForReuse() {
            super.prepareForReuse()
            CXC_ModImage.image = nil
        }

        func getImage(content: ModsModel_CXC, contentType: ContentType) {
            CXC_ModImage.showActivityIndicator()

            Task {
                do {
                    let image = try await CXC_Dropbox.shared.fetchImage(contentType: contentType, imagePath: content.image)
                    
                    DispatchQueue.main.async {
                        if let image = image {
                            self.CXC_ModImage.image = image
                            self.CXC_ModImage.isHidden = false
                        } else {
                            self.CXC_ModImage.image = nil
                        }
                        self.CXC_ModImage.hideActivityIndicatorView()
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.CXC_ModImage.hideActivityIndicatorView()
                        self.CXC_ModImage.image = nil
                        print("🤕 Error fetching image:", error)
                    }
                }
            }
        }
    
    func config(content: ModsModel_CXC) {
        CXC_ModNameLabel.text = content.name
        CXC_ModВescriptionLabel.text = content.modDescription
        if content.isFavorite == true {
            CXC_SaveButton.setImage(UIImage(named: "saved"), for: .normal)
        } else {
            CXC_SaveButton.setImage(UIImage(named: "empty"), for: .normal)
        }
    }
    
    @IBAction func CXC_OpenButtonAction(_ sender: Any) {
        openButtonActionClosure?()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        saveButtonActionClosure?()
    }
}
