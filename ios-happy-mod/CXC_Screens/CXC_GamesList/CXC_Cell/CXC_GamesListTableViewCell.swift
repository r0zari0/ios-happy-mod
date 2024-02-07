//
//  CXC_GamesListTableViewCell.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/5/24.
//

import UIKit

class CXC_GamesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CXC_Label: UILabel!
    
    @IBOutlet weak var CXC_ArrowImage: UIButton!
    
    @IBOutlet weak var CXC_MyView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUPTableViewCell()
    }
    
    func setUPTableViewCell() {
        selectionStyle = .none
        CXC_MyView.layer.cornerRadius = 16
    }
    
    func config() {
        
    }
}
