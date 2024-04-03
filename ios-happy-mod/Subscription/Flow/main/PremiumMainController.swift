import UIKit
import AVKit
import AVFoundation

//

private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
    let firstBias = "Chaewon".count * 777
    let secondBias = "Wonyoung".count / 777
    let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
    return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
}

protocol PremiumMainControllerDelegate: AnyObject {
    func premiumControllerDidDismiss()
}

enum PremiumMainControllerStyle: CaseIterable {
    case mainProduct,unlockContentProduct,unlockFuncProduct,unlockOther, unlockFour, unlockFive
    
    var productIdentifier: String {
        switch self {
        case .mainProduct:
            return Configurations_REFACTOR.mainSubscriptionID
        case .unlockContentProduct:
            return Configurations_REFACTOR.unlockContentSubscriptionID
        case .unlockFuncProduct:
            return Configurations_REFACTOR.unlockFuncSubscriptionID
        case .unlockOther:
            return Configurations_REFACTOR.unlockerThreeSubscriptionID
        case .unlockFour:
            return Configurations_REFACTOR.unlockerFourSubscriptionID
        case .unlockFive:
            return Configurations_REFACTOR.unlockerFiveSubscriptionID
        }
    }
}

class PremiumMainController: UIViewController {
    
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    
    private weak var player: Player!
    private var view0 = ReusableView()
    private var view1 = ReusableView()
    private var viewTransaction = TransactionView()
    
    @IBOutlet private weak var freeform: UIView!
    @IBOutlet private weak var videoElement: UIView!
    @IBOutlet private weak var restoreBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    
    public var productBuy : PremiumMainControllerStyle = .mainProduct
    
    private var intScreenStatus = 0
    
    weak var delegate: PremiumMainControllerDelegate?
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initVideoElement_REFACTOR()
        startMaked_REFACTOR()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !NetworkStatusMonitor.shared.isNetworkAvailable {
            showMess_REFACTOR()
        }
    }
    
    deinit {
        deinitPlayer_REFACTOR()
    }
    
    private func initVideoElement_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        DispatchQueue.main.asyncAfter(deadline: .now()) { [self] in
            BGPlayer_REFACTOR()
        }
    }
    
    
    //MARK: System events
    
    private func deinitPlayer_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        if let player {
          self.player.volume = 0
          self.player.url = nil
          self.player.didMove(toParent: nil)
        }
        player = nil
      }

    // MARK: - Setup Video Player

    private func BGPlayer_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        var pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPhone, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
        if UIDevice.current.userInterfaceIdiom == .pad {
            switch productBuy {
            case .mainProduct:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPad, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockContentProduct:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPadContent, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockFuncProduct:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPadFunc, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockOther:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPadThree, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockFour:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPadFour, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockFive:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPadFive, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            }
        } else{
            switch productBuy {
            case .mainProduct:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPhone, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockContentProduct:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPhoneContent, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockFuncProduct:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPhoneFunc, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockOther:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPhoneThree, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockFour:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPhoneFour, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            case .unlockFive:
                pathUrl = Bundle.main.url(forResource: ConfigurationMediaSub_REFACTOR.nameFileVideoForPhoneFive, withExtension: ConfigurationMediaSub_REFACTOR.videoFileType)
            }
        }

       let player = Player()
        //player.muted = true
        player.playerDelegate = self
        player.playbackDelegate = self
        player.view.frame = self.view.bounds

        addChild(player)
        view.addSubview(player.view)
        player.didMove(toParent: self)
        player.url = pathUrl
        if UIDevice.current.userInterfaceIdiom == .pad {
            player.playerView.playerFillMode = .resizeAspectFill
        }else{
            player.playerView.playerFillMode = .resize
        }
        player.playbackLoops = true
        view.sendSubviewToBack(player.view)
        self.player = player
    }
    
    private func loopVideoMB_REFACTOR(videoPlayer:AVPlayer){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: .zero)
            videoPlayer.play()
        }
    }
    
    // MARK: - Make UI/UX
    
    private func startMaked_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        setRestoreBtn_REFACTOR()
        if productBuy == .mainProduct {
            setReusable_REFACTOR(config: .first, isHide: false)
            setReusable_REFACTOR(config: .second, isHide: true)
            setTransaction_REFACTOR(isHide: true)
        } else {
            setTransaction_REFACTOR(isHide: false)
            self.showRestore_REFACTOR()
        }
    }
    
    //reusable setup
    
    private func generateContentForView_REFACTOR(config: configView) -> [ReusableContentCell] {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        var contentForCV : [ReusableContentCell] = []
        switch config {
        case .first:
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text1ID"), image: UIImage(named: "2_1des")!, selectedImage: UIImage(named: "2_1sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text2ID"), image: UIImage(named: "2_2des")!, selectedImage: UIImage(named: "2_2sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text3ID"), image: UIImage(named: "2_3des")!, selectedImage: UIImage(named: "2_3sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text4ID"), image: UIImage(named: "2_4des")!, selectedImage: UIImage(named: "2_4sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text5ID"), image: UIImage(named: "2_5des")!, selectedImage: UIImage(named: "2_5sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text1ID"), image: UIImage(named: "2_1des")!, selectedImage: UIImage(named: "2_1sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text2ID"), image: UIImage(named: "2_2des")!, selectedImage: UIImage(named: "2_2sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text3ID"), image: UIImage(named: "2_3des")!, selectedImage: UIImage(named: "2_3sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text4ID"), image: UIImage(named: "2_4des")!, selectedImage: UIImage(named: "2_4sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text5ID"), image: UIImage(named: "2_5des")!, selectedImage: UIImage(named: "2_5sel")!))
            return contentForCV
        case .second:
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text1ID"), image: UIImage(named: "2_1des")!, selectedImage: UIImage(named: "2_1sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text2ID"), image: UIImage(named: "2_2des")!, selectedImage: UIImage(named: "2_2sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text3ID"), image: UIImage(named: "2_3des")!, selectedImage: UIImage(named: "2_3sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text4ID"), image: UIImage(named: "2_4des")!, selectedImage: UIImage(named: "2_4sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text5ID"), image: UIImage(named: "2_5des")!, selectedImage: UIImage(named: "2_5sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text1ID"), image: UIImage(named: "2_1des")!, selectedImage: UIImage(named: "2_1sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text2ID"), image: UIImage(named: "2_2des")!, selectedImage: UIImage(named: "2_2sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text3ID"), image: UIImage(named: "2_3des")!, selectedImage: UIImage(named: "2_3sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text4ID"), image: UIImage(named: "2_4des")!, selectedImage: UIImage(named: "2_4sel")!))
            contentForCV.append(ReusableContentCell(title: localizedString_REFACTOR(forKey:"Text5ID"), image: UIImage(named: "2_5des")!, selectedImage: UIImage(named: "2_5sel")!))
            return contentForCV
        case .transaction: return contentForCV
        }
    }
    
    private func setReusable_REFACTOR(config : configView, isHide : Bool){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        var currentView : ReusableView? = nil
        var viewModel : ReusableViewModel? = nil
        switch config {
        case .first:
            viewModel =  ReusableViewModel(title: localizedString_REFACTOR(forKey: "TextTitle1ID").uppercased(), items: self.generateContentForView_REFACTOR(config: config))
            currentView = self.view0
        case .second:
            viewModel =  ReusableViewModel(title: localizedString_REFACTOR(forKey: "TextTitle2ID").uppercased(), items: self.generateContentForView_REFACTOR(config: config))
            currentView = self.view1
        case .transaction:
            currentView = nil
        }
        guard let i = currentView else { return }
        i.protocolElement = self
        i.viewModel = viewModel
        i.configView = config
        freeform.addSubview(i)
        freeform.bringSubviewToFront(i)
        
        i.snp.makeConstraints { make in
            make.height.equalTo(338)
            make.width.equalTo(freeform).multipliedBy(1)
            make.centerX.equalTo(freeform).multipliedBy(1)
            make.bottom.equalTo(freeform).offset(0)
        }
        i.isHidden = isHide
    }
    //transaction setup
    
    private func setTransaction_REFACTOR( isHide : Bool) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.viewTransaction.inapp.productBuy = self.productBuy
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.viewTransaction.setLocalization_REFACTOR()
        }
        freeform.addSubview(self.viewTransaction)
        freeform.bringSubviewToFront(self.viewTransaction)
        self.viewTransaction.inapp.productBuy = self.productBuy
        self.viewTransaction.snp.makeConstraints { make in
            //            make.height.equalTo(338)
            make.width.equalTo(freeform).multipliedBy(1)
            make.centerX.equalTo(freeform).multipliedBy(1)
            make.bottom.equalTo(freeform).offset(0)
        }
        self.viewTransaction.isHidden = isHide
        self.viewTransaction.delegate = self
    }
    
    // restore button setup
    
    private func setRestoreBtn_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.restoreBtn.isHidden = true
        self.restoreBtn.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 22)
        self.restoreBtn.setTitle(localizedString_REFACTOR(forKey: "restore"), for: .normal)
        self.restoreBtn.titleLabel?.setShadow()
        self.restoreBtn.tintColor = .white
        self.restoreBtn.setTitleColor(.white, for: .normal)
    }
    
    private func openApp_REFACTOR(){
    
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }
        
        //
        switch productBuy {
        case .mainProduct:
            let vc = LoadingVC_CXCViewController()
            let navController = UINavigationController(rootViewController: vc)
            navController.modalPresentationStyle = .fullScreen
            UIApplication.shared.setRootVC(navController)
        default :
            dismiss(animated: true) {
                self.delegate?.premiumControllerDidDismiss()
            }
        }
        
        UIApplication.shared.notificationFeedbackGenerator(type: .success)
        deinitPlayer_REFACTOR()
    }
    
    private func showRestore_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.restoreBtn.isHidden = false
        if productBuy != .mainProduct {
            self.closeBtn.isHidden = false
        }
    }
    
    @IBAction func restoreAction_REFACTOR(_ sender: UIButton) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.viewTransaction.restoreAction_REFACTOR()
    }
    
    @IBAction func closeController_REFACTOR(_ sender: UIButton) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        dismiss(animated: true)
    }
}

extension PremiumMainController : ReusableViewEvent {
    func nextStep_REFACTOR(config: configView) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        switch config {
        case .first:
            self.view0.fadeOut()
            self.view1.fadeIn()
            UIApplication.shared.impactFeedbackGenerator(type: .medium)
//            ThirdPartyServicesManager.shared.makeATT_REFACTOR()
        case .second:
            self.view1.fadeOut()
            self.viewTransaction.fadeIn()
            self.showRestore_REFACTOR()
            //            self.viewTransaction.title.restartpageControl()
            UIApplication.shared.impactFeedbackGenerator(type: .medium)
        case .transaction: break
        }
    }
}

extension PremiumMainController: NetworkStatusMonitorDelegate {
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
}

extension PremiumMainController : TransactionViewEvents {
    
    func userSubscribed_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        self.openApp_REFACTOR()
    }
    
    func transactionTreatment_REFACTOR(title: String, message: String) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        UIApplication.shared.notificationFeedbackGenerator(type: .warning)
    }
    
    func transactionFailed_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        print(#function)
        UIApplication.shared.notificationFeedbackGenerator(type: .error)
    }
    
    func privacyOpen_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        Configurations_REFACTOR.policyLink.openURL()
    }
    
    func termsOpen_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        Configurations_REFACTOR.termsLink.openURL()
    }
}

extension PremiumMainController: PlayerDelegate, PlayerPlaybackDelegate {
    func playerReady(_ player: Player) { }

    func playerPlaybackStateDidChange(_ player: Player) { }

    func playerBufferingStateDidChange(_ player: Player) { }

    func playerBufferTimeDidChange(_ bufferTime: Double) { }

    func player(_ player: Player, didFailWithError error: Error?) { }

    func playerCurrentTimeDidChange(_ player: Player) { }

    func playerPlaybackWillStartFromBeginning(_ player: Player) { }

    func playerPlaybackDidEnd(_ player: Player) { }

    func playerPlaybackWillLoop(_ player: Player) { }

    func playerPlaybackDidLoop(_ player: Player) { }
}
