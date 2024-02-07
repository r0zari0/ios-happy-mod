//
//  CXC_MenuVC.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/7/24.
//

import UIKit

class CXC_MenuVC: UIViewController {
    @IBOutlet weak var CXC_MenuLabel: UILabel!
    
    @IBOutlet weak var CXC_GamesButton: UIButton!
    @IBOutlet weak var CXC_AppsButton: UIButton!
    @IBOutlet weak var CXC_TopicsButton: UIButton!
    @IBOutlet weak var CXC_FavoritesButton: UIButton!
    @IBOutlet weak var CXC_XButton: UIButton!
    
    let presenter: CXC_MenuPresenter
    
    init(presenter: CXC_MenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CXC_XActionButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
