
import UIKit

class CXC_GamesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CXC_Label: UILabel!
    
    @IBOutlet weak var CXC_ArrowImage: UIButton!
    
    @IBOutlet weak var CXC_MyView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMyCXC_TableViewCell()
    }
    
    func setupMyCXC_TableViewCell() {
        selectionStyle = .none
        CXC_MyView.layer.cornerRadius = 16
    }
    
    func config(content: ModsType, isLocked: Bool) {
        CXC_Label.text = content.name
        let imageName = isLocked ? "lockedImage" : "arrowImage"
        CXC_ArrowImage.setImage(UIImage(named: imageName), for: .normal)
        CXC_MyView.backgroundColor = isLocked ? .myGreen : .myDarkGreen
    }
}
