//
//  CXC_ModsVC.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/5/24.
//

import UIKit

class CXC_ModsVC: UIViewController {
    
    @IBOutlet weak var CXC_ModCollectionView: UICollectionView!
    
    let presenter: CXC_ModsPresenter
    
    init(presenter: CXC_ModsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupUI() {
        
    }
    
    func setupCollectionView() {
        CXC_ModCollectionView.showsVerticalScrollIndicator = false
        
        CXC_ModCollectionView.delegate = self
        CXC_ModCollectionView.dataSource = self
        CXC_ModCollectionView.register(.init(nibName: String(describing: CXC_ModCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CXC_ModCell.self))
    }
    
}

extension CXC_ModsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CXC_ModCell.self), for: indexPath) as! CXC_ModCell
        
//        let ***** = presenter.*****[indexPath.item]
        
        cell.config()
        
        return cell
    }
    
    
}
