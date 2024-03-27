import Foundation
import UIKit
import SnapKit
//

private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
    let firstBias = "Chaewon".count * 777
    let secondBias = "Wonyoung".count / 777
    let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
    return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
}

//

class SliderCellView: UIView {
    
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    
    private var fontName: String = Configurations_REFACTOR.getSubFontName_REFACTOR()
    private var textColot: UIColor = UIColor.white
    
    lazy var titleLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: fontName, size: 12)
        label.textColor = textColot
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            label.textAlignment = .right
        } else {
            label.textAlignment = .left
        }
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: fontName, size: 12)
        label.textColor = textColot
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            label.textAlignment = .right
        } else {
            label.textAlignment = .left
        }
        return label
    }()
    
    lazy var starIcon: UIImageView = {
       var image = UIImageView()
        image.image = UIImage(named: "star")
        image.transform = CGAffineTransform(scaleX: 0.55, y: 0.55)
        return image
    }()
    
    lazy var stackView: UIStackView = {
       var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    convenience init(title: String, subTitle: String) {
        self.init()
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView_REFACTOR()
        makeConstraints_REFACTOR()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func configureView_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        addSubview(starIcon)
    }
    
    func makeConstraints_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        starIcon.snp.remakeConstraints { make in
//            make.height.equalTo(50)
            make.width.equalTo(starIcon.snp.height)
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        stackView.snp.remakeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(starIcon.snp_trailingMargin).offset(10)
        }
    }
}
