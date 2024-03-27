
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
    //type
    func config(content: ModsType) {
        CXC_Label.text = content.name
//            if let apptype = content as? AppsType {
//                CXC_Label.text = apptype.name
//            } else if let gamesType = content as? ModsType {
//                CXC_Label.text = gamesType.name
//            }
        }
    }
