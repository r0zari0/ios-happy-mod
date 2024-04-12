
import UIKit

class TopicCell: UICollectionViewCell {

    @IBOutlet weak var unpackingButton: UIButton!
    
    @IBOutlet weak var topicImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var versionView: UIView!
    @IBOutlet weak var versionLabel: UILabel!
    
    var actionClosure: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMyUI_CXC()
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
        topicImage.image = nil
        }
    
    func setupMyUI_CXC() {
        topicImage.layer.cornerRadius = 14
        unpackingButton.layer.cornerRadius = 14
        saveButton.layer.cornerRadius = 12
        
        versionView.layer.cornerRadius = 8
    }
    
    func config(topic: TopicModVariant) {
        versionLabel.text = topic.version
        topicImage.image = UIImage(named: topic.displayImage)
    }
    
    func getImage(content: TopicModVariant, contentType: ContentType) {
        topicImage.showActivityIndicator()

        Task {
            do {
                let image = try await CXC_Dropbox.shared.fetchImage(contentType: contentType, imagePath: content.displayImage)
                
                DispatchQueue.main.async {
                    if let image = image {
                        self.topicImage.image = image
                        self.topicImage.isHidden = false
                    } else {
                        self.topicImage.image = nil
                    }
                    self.topicImage.hideActivityIndicatorView()
                }
            } catch {
                DispatchQueue.main.async {
                    self.topicImage.hideActivityIndicatorView()
                    self.topicImage.image = nil
                    print("🤕 Error fetching image:", error)
                }
            }
        }
    }
    
    @IBAction func unpackingButtonAction(_ sender: Any) {
        actionClosure?()
    }
}
