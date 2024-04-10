enum AlertType {
    case noButton
    case withButton
}

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBOutlet weak var internetAlertView: UIView!
    @IBOutlet weak var connectionAlertLabel: UILabel!
    @IBOutlet weak var detailedAlertLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    var text: String
    
    var alertType: AlertType
    
    init(text: String, alertType: AlertType) {
        self.text = text
        self.alertType = alertType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
}
    func setupUI() {
        
        switch alertType {
        case .noButton:
            alertView.isHidden = false
            internetAlertView.isHidden = true
        case .withButton:
            internetAlertView.isHidden = false
            alertView.isHidden = true
        }
        
        alertView.layer.cornerRadius = 16
        alertView.backgroundColor = .alertGreen
        
        alertLabel.text = text
        alertLabel.textColor = .white
        
        internetAlertView.layer.cornerRadius = 16
        internetAlertView.backgroundColor = .alertGreen
        
        connectionAlertLabel.textColor = .white
        connectionAlertLabel.text = "Connection issue"
        
        detailedAlertLabel.textColor = .white
        detailedAlertLabel.text = "Check the internet connection on your device."
        
        okButton.backgroundColor = .myGreen
        okButton.layer.cornerRadius = 12
    }
    
}
