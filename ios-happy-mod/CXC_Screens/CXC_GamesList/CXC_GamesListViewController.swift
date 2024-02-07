//
//  CXC_GamesListViewController.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/5/24.
//

import UIKit
import Foundation

class CXC_GamesListViewController: UIViewController {
    
    @IBOutlet weak var CXC_MenuButton: UIButton!
    
    @IBOutlet weak var CXC_GamesListTableView: UITableView!
    
    let presenter: CXC_GamesListPresenter
//    let screenType: ScreenType
    
    let cellIdentifier: String = String(describing: "CXC_GamesListTableViewCell")
    
    let cellData = ["Ячейка 1", "Ячейка 2", "Ячейка 3", "Ячейка 4", "Ячейка 5", "Ячейка 6", "Ячейка 7", "Ячейка 8", "Ячейка 9", "Ячейка 10"]
    
    init(presenter: CXC_GamesListPresenter/*, screenType: ScreenType*/) {
        self.presenter = presenter
//        self.screenType = screenType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    func setupUI() {
        CXC_MenuButton.titleLabel?.textColor = .white
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func setupTableView() {
        CXC_GamesListTableView.showsVerticalScrollIndicator = false
        
        CXC_GamesListTableView.dataSource = self
        CXC_GamesListTableView.delegate = self
        CXC_GamesListTableView.register(.init(nibName: String(describing: cellIdentifier), bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    @IBAction func CXC_MenuActionButton() {
        
        presenter.showMenu(vc: self/*, screenType: screenType*/)
    }
    
}

extension CXC_GamesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CXC_GamesListTableViewCell

        cell.backgroundColor = .clear
        
        cell.contentView.layer.masksToBounds = true
        
        cell.CXC_Label.text = cellData[indexPath.row]
        
        //        cell.config()
        
        return cell
    }
    
    
}
