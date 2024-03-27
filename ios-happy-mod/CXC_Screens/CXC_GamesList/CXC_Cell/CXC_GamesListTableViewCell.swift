
import UIKit

class CXC_GamesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CXC_Label: UILabel!
    
    @IBOutlet weak var CXC_ArrowImage: UIButton!
    
    @IBOutlet weak var CXC_MyView: UIView!
    
    var isLocked: Bool = true {
        didSet {
            if isLocked {
                
            } else {
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMyCXC_TableViewCell()
    }
    
    func setupMyCXC_TableViewCell() {
        selectionStyle = .none
        CXC_MyView.layer.cornerRadius = 16
    }
    
    func config(content: ModsType) {
        CXC_Label.text = content.name
        }
    }
