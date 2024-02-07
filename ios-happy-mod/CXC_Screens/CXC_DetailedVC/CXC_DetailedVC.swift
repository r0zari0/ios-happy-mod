//
//  CXC_DetailedVC.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/7/24.
//

import UIKit

class CXC_DetailedVC: UIViewController {

    @IBOutlet weak var CXC_SearchButton: UIButton!
    @IBOutlet weak var CXC_BackButton: UIButton!
    
    @IBOutlet weak var CXC_DownloadButton: UIButton!
    @IBOutlet weak var CXC_ModImage: UIImageView!
    
    @IBOutlet weak var CXC_NameLabel: UILabel!
    @IBOutlet weak var CXC_TitleLabel: UILabel!
    @IBOutlet weak var CXC_Description: UILabel!
    
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
        setupUI()
    }
    
    func setupUI() {
        
    }
}
