
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
//    window = UIWindow(frame: UIScreen.main.bounds)
//
//    
//    window?.rootViewController = UINavigationController(rootViewController: vc)
//    window?.makeKeyAndVisible()
//    window?.overrideUserInterfaceStyle = .unspecified
//    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window?.windowScene = scene
        
        let window = UIWindow(windowScene: scene)
        self.window = window
        
        IAPManager.shared.validateSubscriptions_REFACTOR(productIdentifiers: [Configurations_REFACTOR.mainSubscriptionID,
                                                                              Configurations_REFACTOR.unlockFuncSubscriptionID,
                                                                              Configurations_REFACTOR.unlockContentSubscriptionID,
                                                                              Configurations_REFACTOR.unlockerThreeSubscriptionID,
                                                                              Configurations_REFACTOR.unlockerFourSubscriptionID,
                                                                              Configurations_REFACTOR.unlockerFiveSubscriptionID]
        ) { result in
            if let userHaveSub = result[Configurations_REFACTOR.mainSubscriptionID] {
                switch userHaveSub {
                case true:
                    let navigator = CXC_Navigator()
                    let realm = DataBaseManager()
                    let dropBox = CXC_Dropbox()
                    
                    let vc: LoadingVC_CXCViewController = LoadingVC_CXCViewController(dropBox: dropBox, navigator: navigator, realmDB: realm)
                    let navController = UINavigationController(rootViewController: vc)
                    navController.modalPresentationStyle = .fullScreen
                    window.rootViewController = navController
                    window.makeKeyAndVisible()
                case false:
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        let unsubscribedVC = PremiumMainController()
                        unsubscribedVC.modalPresentationStyle = .fullScreen
                        window.rootViewController = unsubscribedVC
                        window.makeKeyAndVisible()
                    })
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    let unsubscribedVC = PremiumMainController()
                    unsubscribedVC.modalPresentationStyle = .fullScreen
                    window.rootViewController = unsubscribedVC
                    window.makeKeyAndVisible()
                })
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        Task {
            try? await Task.sleep(nanoseconds: 500_000_000)
            ThirdPartyServicesManager.shared.makeATT_REFACTOR()
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

//    func sceneDidEnterBackground(_ scene: UIScene) {
//        // Called as the scene transitions from the foreground to the background.
//        // Use this method to save data, release shared resources, and store enough scene-specific state information
//        // to restore the scene back to its current state.
//
//        // Save changes in the application's managed object context when the application transitions to the background.
//        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
//        
//        Task {
//            try? await Task.sleep(nanoseconds: 500_000_000)
//            ThirdPartyServicesManager.shared.makeATT_REFACTOR()
//        }
//    }
}
