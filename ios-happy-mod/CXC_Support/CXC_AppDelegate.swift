
import UIKit
import Pushwoosh
import Adjust
import AVFoundation
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate, PWMessagingDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       FirebaseApp.configure()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting up AVAudioSession: \(error.localizedDescription)")
        }
        
        ThirdPartyServicesManager.shared.initializeAdjust_REFACTOR()
        ThirdPartyServicesManager.shared.initializePushwoosh_REFACTOR(delegate: self)
        ThirdPartyServicesManager.shared.initializeInApps_REFACTOR()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
