
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
        
//        saveModButton.addTarget(self, action: #selector(saveModButtonAction(_:)), for: .touchUpInside)
        
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
    
//    @objc func saveModButtonAction(_ sender: UIButton) {
//            presenter.saveToFavorites()
//        }
}
