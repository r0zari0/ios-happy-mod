import UIKit

class CXC_MenuVC: UIViewController {
    
    @IBOutlet weak var CXC_MenuLabel: UILabel!
    
    @IBOutlet weak var CXC_GamesButton: UIButton!
    @IBOutlet weak var CXC_AppsButton: UIButton!
    @IBOutlet weak var CXC_TopicsButton: UIButton!
    @IBOutlet weak var CXC_FavoritesButton: UIButton!
    @IBOutlet weak var CXC_XButton: UIButton!
    
    lazy var buttons = [CXC_GamesButton, CXC_AppsButton, CXC_TopicsButton, CXC_FavoritesButton]
    
    var selectedIndex: Int = 0
    
    let presenter: CXC_MenuPresenter
    let dropBox: CXC_Dropbox
    
    init(presenter: CXC_MenuPresenter, dropBox: CXC_Dropbox, selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        self.presenter = presenter
        self.dropBox = dropBox
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyCXC_Buttons()
    }
    
    func setupMyCXC_Buttons() {
        buttons.indices.forEach { index in
            buttons[index]?.layer.cornerRadius = 16
            buttons[index]?.backgroundColor = selectedIndex == index ? .myGreen : .lightGreen
        }
    }
    
    @IBAction func CXC_XActionButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
//        dismiss(animated: true)
    }
    
    @IBAction func CXC_GamesButtonAction(_ sender: UIButton) {
        buttonTapped(sender)
    }
    
    @IBAction func CXC_AppsButtonAction(_ sender: UIButton) {
        buttonTapped(sender)
    }
    
    @IBAction func CXC_TopicsButtonAction(_ sender: UIButton) {
        buttonTapped(sender)
    }
    
    @IBAction func CXC_FavoritesButtonAction(_ sender: UIButton) {
        buttonTapped(sender)
    }
}

extension CXC_MenuVC {
    
    func buttonTapped(_ sender: UIButton) {
        buttons.forEach { $0?.isSelected = false }
        selectButton(sender)
        
        switch sender {
        case CXC_GamesButton:
            self.presenter.navigator.showCXC_GamesListVC(view: self, dropBox: dropBox, screenType: .games)
        case CXC_AppsButton:
            self.presenter.navigator.showCXC_GamesListVC(view: self, dropBox: dropBox, screenType: .apps)
        case CXC_TopicsButton:
            self.presenter.navigator.showCXC_GamesListVC(view: self, dropBox: dropBox, screenType: .topics)
        case CXC_FavoritesButton:
            selectedIndex = 3
            selectButton(sender)
            self.presenter.navigator.showCXC_ModVC(view: self, screenType: .favorites, mod: [])
        default: break
        }
    }
    
    func selectButton(_ sender: UIButton) {
        sender.isSelected = true
        buttons.indices.forEach { index in
            buttons[index]?.backgroundColor = selectedIndex == index ? .myGreen : .lightGreen
        }
    }
}
