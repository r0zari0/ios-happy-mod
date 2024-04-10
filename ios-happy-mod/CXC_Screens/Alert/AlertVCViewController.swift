//
//import UIKit
//
//enum AlertType {
//    case withButton(String)
//    case NoButton(String)
//}
//
//class AlertVCViewController: UIViewController {
//    @IBOutlet weak var unsuccessfulView: UIView!
//    @IBOutlet weak var unsuccessfulLabel: UILabel!
//   
//    @IBOutlet weak var issueView: UIView!
//    @IBOutlet weak var issueLabel: UILabel!
//    @IBOutlet weak var checkInternetLabel: UILabel!
//    @IBOutlet weak var okButton: UIButton!
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//       override func viewDidLoad() {
//           super.viewDidLoad()
//
//       }
//       
//       func setupUI(alertText: String?) {
//           unsuccessfulView.layer.cornerRadius = 16
//           issueView.layer.cornerRadius = 16
//           
//           unsuccessfulView.backgroundColor = .lightGreen
//           issueView.backgroundColor = .lightGreen
//           
//           if let text = alertText {
//               issueLabel.text = text
//           }
//       }
//    
//    @IBAction func okActionButton(_ sender: Any) {
//    }
//}
