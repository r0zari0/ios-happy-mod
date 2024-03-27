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

protocol TransactionViewEvents : AnyObject {
    func userSubscribed_REFACTOR()
    func transactionTreatment_REFACTOR(title: String, message: String)
    func transactionFailed_REFACTOR()
    func privacyOpen_REFACTOR()
    func termsOpen_REFACTOR()
}

class TransactionView: UIView,AnimatedButtonEvent,IAPManagerProtocol, NetworkStatusMonitorDelegate {
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    func showMess_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        transactionTreatment_REFACTOR(title: NSLocalizedString( "ConnectivityTitle", comment: ""), message: NSLocalizedString("ConnectivityDescription", comment: ""))
    }
    
    
    private let xib = "TransactionView"
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private(set) weak var title: UILabel!
    @IBOutlet private weak var sliderStack: UIStackView!
    @IBOutlet private weak var trialLb: UILabel!
    @IBOutlet private weak var descriptLb: UILabel!
    @IBOutlet private weak var purchaseBtn: AnimatedButton!
    @IBOutlet private weak var privacyBtn: UIButton!
    @IBOutlet private weak var policyBtn: UIButton!
    @IBOutlet private weak var sliderWight: NSLayoutConstraint!
    @IBOutlet private weak var sliderTop: NSLayoutConstraint!
    @IBOutlet private weak var conteinerWidth: NSLayoutConstraint!
    @IBOutlet private weak var heightView: NSLayoutConstraint!
    //@IBOutlet private weak var trialWight: NSLayoutConstraint!
    @IBOutlet weak var trialView: UIView!
    
    private let currentFont = Configurations_REFACTOR.getSubFontName_REFACTOR()
    public let inapp = IAPManager.shared
    private let locale = NSLocale.current.languageCode
    public weak var delegate : TransactionViewEvents?
    private let networkingMonitor = NetworkStatusMonitor.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Init_REFACTOR()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Init_REFACTOR()
    }
    
    private func Init_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        Bundle.main.loadNibNamed(xib, owner: self, options: nil)
        if UIDevice.current.userInterfaceIdiom == .phone {
            // Устройство является iPhone
            if UIScreen.main.nativeBounds.height >= 2436 {
                heightView.constant = 163
            } else {
//                sliderTop.constant = 60
                heightView.constant = 152
            }
        } else {
            conteinerWidth.constant = 400
            heightView.constant = 167
//            sliderTop.constant = 45
        }
        contentView.fixInView(self)
        contentView.backgroundColor = .clear
        buildConfigs_REFACTOR()
    }
    
    private func buildConfigs_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        configScreen_REFACTOR()
        setSlider_REFACTOR()
        setConfigLabels_REFACTOR()
        setConfigButtons_REFACTOR()
        setLocalization_REFACTOR()
        configsInApp_REFACTOR()
    }
    
    private func setSlider_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        title.text = (localizedString_REFACTOR(forKey: "SliderID1").uppercased())
        var texts: [String] = ["\(localizedString_REFACTOR(forKey: "SliderID2"))",
                               "\(localizedString_REFACTOR(forKey: "SliderID3"))",
                               "\(localizedString_REFACTOR(forKey: "SliderID4"))",
                               ]
        for t in texts {
            sliderStack.addArrangedSubview(SliderCellView(title: t, subTitle: t.lowercased()))
        }
    }
    
    //MARK: config labels
    
    private func setConfigLabels_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        //slider
        title.textColor = .white
        title.font = UIFont(name: currentFont, size: 24)
//        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 4
        title.setShadow()
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            title.textAlignment = .right
        }
        title.lineBreakMode = .byClipping
        if UIDevice.current.userInterfaceIdiom == .pad {
            title.font = UIFont(name: currentFont, size: 24)
        }
        trialLb.setShadow()
        trialLb.font = UIFont(name: currentFont, size: 13)
        trialLb.textColor = .white
        trialLb.textAlignment = .center
        trialLb.numberOfLines = 2
        trialLb.adjustsFontSizeToFitWidth = true
        
        descriptLb.setShadow()
        descriptLb.textColor = .white
        descriptLb.textAlignment = .center
        descriptLb.numberOfLines = 0
        descriptLb.font = UIFont.systemFont(ofSize: 15)
        
        privacyBtn.titleLabel?.setShadow()
        privacyBtn.titleLabel?.numberOfLines = 2
        privacyBtn.titleLabel?.textAlignment = .center
        
        privacyBtn.setTitleColor(.white, for: .normal)
        privacyBtn.tintColor = .white
        
        policyBtn.titleLabel?.setShadow()
        policyBtn.titleLabel?.numberOfLines = 2
        policyBtn.titleLabel?.textAlignment = .center
        policyBtn.setTitleColor(.white, for: .normal)
        policyBtn.tintColor = .white
        privacyBtn.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 12)
        policyBtn.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 12)
    }
    
    //MARK: config button
    
    private func setConfigButtons_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.purchaseBtn.delegate = self
        self.purchaseBtn.style = .native
    }
    
    //MARK: config localization
    
    public func setLocalization_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
//        title.labelTextsForSlider = "\(localizedString(forKey: "SliderID1").uppercased())|n\(localizedString(forKey: "SliderID2").uppercased())|n\(localizedString(forKey: "SliderID3").uppercased()) |n\(localizedString(forKey: "SliderID4").uppercased()) |n\(localizedString(forKey: "SliderID5").uppercased())"
        
        let localizedPrice = inapp.localizedPrice_REFACTOR()
        descriptLb.text = localizedString_REFACTOR(forKey: "iOSAfterID").replacePriceWithNewPrice_REFACTOR(newPriceString: localizedPrice)
        
        if locale == "en" {
            trialLb.text = "Start 3-days for FREE\n Then \(localizedPrice)/week".uppercased()
        } else {
            trialLb.text = ""
            trialView.isHidden = true
        }
        privacyBtn.titleLabel?.lineBreakMode = .byWordWrapping
        privacyBtn.setAttributedTitle(localizedString_REFACTOR(forKey: "TermsID").underLined, for: .normal)
        policyBtn.titleLabel?.lineBreakMode = .byWordWrapping
        policyBtn.setAttributedTitle(localizedString_REFACTOR(forKey: "PrivacyID").underLined, for: .normal)
    }
    
    //MARK: screen configs
    
    private func configScreen_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        if UIDevice.current.userInterfaceIdiom == .pad {
            //trialWight.setValue(0.28, forKey: "multiplier")
            //sliderWight.setValue(0.5, forKey: "multiplier")
        } else {
            //trialWight.setValue(0.46, forKey: "multiplier")
            //sliderWight.setValue(0.8, forKey: "multiplier")
        }
    }
    
    //MARK: configs
    
    private func configsInApp_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.inapp.transactionsDelegate = self
        self.networkingMonitor.delegate = self
    }
    
    public func restoreAction_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        inapp.doRestore_REFACTOR()
    }
    
    //MARK: actions
    
    @IBAction func privacyAction_REFACTOR(_ sender: UIButton) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.delegate?.termsOpen_REFACTOR()
    }
    
    @IBAction func termsAction_REFACTOR(_ sender: UIButton) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.delegate?.privacyOpen_REFACTOR()
    }
    
    func onClick_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        UIApplication.shared.impactFeedbackGenerator(type: .heavy)
        if networkingMonitor.checkInternetConnectivity_REFACTOR() {
            inapp.doPurchase_REFACTOR()
            purchaseBtn.isUserInteractionEnabled = false
        } else {
            showMess_REFACTOR()
        }
    }
    
    //inapp
    
    func transactionTreatment_REFACTOR(title: String, message: String) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        purchaseBtn.isUserInteractionEnabled = true
        self.delegate?.transactionTreatment_REFACTOR(title: title, message: message)
    }
    
    func infoAlert_REFACTOR(title: String, message: String) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        purchaseBtn.isUserInteractionEnabled = true
        self.delegate?.transactionTreatment_REFACTOR(title: title, message: message)
    }
    
    func goToTheApp_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        purchaseBtn.isUserInteractionEnabled = true
        self.delegate?.userSubscribed_REFACTOR()
    }
    
    func failed_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        purchaseBtn.isUserInteractionEnabled = true
        self.delegate?.transactionFailed_REFACTOR()
    }
}

extension String {
    
    func replacePriceWithNewPrice_REFACTOR(newPriceString: String) -> String {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        var result = self.replacingOccurrences(of: "4.99", with: newPriceString.replacingOccurrences(of: "$", with: ""))
        result = result.replacingOccurrences(of: "4,99", with: newPriceString.replacingOccurrences(of: "$", with: ""))
        return result
    }
    
}
