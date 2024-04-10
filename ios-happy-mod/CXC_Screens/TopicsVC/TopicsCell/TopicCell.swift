
import UIKit

class TopicCell: UICollectionViewCell {

    @IBOutlet weak var unpackingButton: UIButton!
    
    @IBOutlet weak var topicImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var versionView: UIView!
    @IBOutlet weak var versionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMyUI_CXC()
        topicImage.image = UIImage(named: "image")
    }
    
    func setupMyUI_CXC() {
        topicImage.layer.cornerRadius = 14
        unpackingButton.layer.cornerRadius = 14
        saveButton.layer.cornerRadius = 12
        
        versionView.layer.cornerRadius = 8
    }
    
    func config() {
//        versionLabel.text = type.topicmodvariant
    }
}
