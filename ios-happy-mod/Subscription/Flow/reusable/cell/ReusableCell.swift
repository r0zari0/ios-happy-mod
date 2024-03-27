//  Created by Melnykov Valerii on 14.07.2023
//


import UIKit

//

private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
    let firstBias = "Chaewon".count * 777
    let secondBias = "Wonyoung".count / 777
    let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
    return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
}

//

class ReusableCell: UICollectionViewCell {
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var titleContainer: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell_REFACTOR()
    }
    
    func setupCell_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        cellLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        cellLabel.font = UIFont(name: Configurations_REFACTOR.getSubFontName_REFACTOR(), size: 10)
        contentContainer.layer.cornerRadius = 8
        titleContainer.layer.cornerRadius = 8
        cellLabel.setShadow(with: 0.5)
        cellImage.layer.cornerRadius = 8
//        cellImage.layer.borderColor = UIColor.black.cgColor
//        cellImage.layer.borderWidth = 2
    }
}
