//
//  CXC_ModCell.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/5/24.
//

import UIKit

class CXC_ModCell: UICollectionViewCell {
    @IBOutlet weak var CXC_ModImage: UIImageView!
    
    @IBOutlet weak var CXC_ModNameLabel: UILabel!
    
    @IBOutlet weak var CXC_ModDescriptionLabel: UILabel!
    
    @IBOutlet weak var CXC_OpenButton: UIButton!
    
    @IBOutlet weak var CXC_SaveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

   func setupUI() {
//       CXC_OpenButton.layer.cornerRadius = 12
//       CXC_SaveButton.layer.cornerRadius = 12
    }
    
    func config() {
        
    }
}
