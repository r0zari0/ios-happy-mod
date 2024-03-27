
import Foundation
import CoreText

//

private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
    let firstBias = "Chaewon".count * 777
    let secondBias = "Wonyoung".count / 777
    let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
    return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
}

//

enum Configurations_REFACTOR {
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    static let subFontUrl = Bundle.main.url(forResource: "sub", withExtension: "ttf")!
    static let adjustToken = "hfg1t85ufqbk"
    
    static let pushwooshToken = "7AAAB-C4F8A"
    static let pushwooshAppName = "test"
    
    static let termsLink: String = "https://www.google.com"
    static let policyLink: String = "https://www.google.com"
    
    static let mainSubscriptionID = "main_sub"
    static let mainSubscriptionPushTag = "MainSubscription"
    static let unlockContentSubscriptionID = "unlockOne"
    static let unlockContentSubscriptionPushTag = "FirstSubscription"
    static let unlockFuncSubscriptionID = "unlockTwo"
    static let unlockFuncSubscriptionPushTag = "SecondSubscription"
    static let unlockerThreeSubscriptionID = "unlockThree"
    static let unlockerThreeSubscriptionPushTag = "ThirdSubscription"
    static let unlockerFourSubscriptionID = "unlockFour"
    static let unlockerFourSubscriptionPushTag = "FourSubscription"
    static let unlockerFiveSubscriptionID = "unlockFive"
    static let unlockerFiveSubscriptionPushTag = "FiveSubscription"
    
    static let subscriptionSharedSecret = "b6ab953c20d94f569410ea195ec43720"
    
    static func getSubFontName_REFACTOR() -> String {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        let fontPath = Configurations_REFACTOR.subFontUrl.path as CFString
        let fontURL = CFURLCreateWithFileSystemPath(nil, fontPath, CFURLPathStyle.cfurlposixPathStyle, false)
        
        guard let fontDataProvider = CGDataProvider(url: fontURL!) else {
            return ""
        }
        
        if let font = CGFont(fontDataProvider) {
            if let postScriptName = font.postScriptName as String? {
                return postScriptName
            }
        }
        
        return ""
    }
    
}


enum ConfigurationMediaSub_REFACTOR {
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    static let nameFileVideoForPhone = "phone"
    static let nameFileVideoForPad = "pad"
    static let nameFileVideoForPhoneContent = "phone2"
    static let nameFileVideoForPadContent = "pad2"
    static let nameFileVideoForPhoneFunc = "phone3"
    static let nameFileVideoForPadFunc = "pad3"
    static let nameFileVideoForPhoneThree = "phone4"
    static let nameFileVideoForPadThree = "pad4"
    static let nameFileVideoForPhoneFour = "phone5"
    static let nameFileVideoForPadFour = "pad5"
    static let nameFileVideoForPhoneFive = "phone6"
    static let nameFileVideoForPadFive = "pad6"
    static let videoFileType = "mp4"
}
