
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window?.windowScene = scene
        
        let window = UIWindow(windowScene: scene)
        self.window = window
        
        let products = [Configurations_REFACTOR.mainSubscriptionID,
                        Configurations_REFACTOR.unlockFuncSubscriptionID,
                        Configurations_REFACTOR.unlockContentSubscriptionID,
                        Configurations_REFACTOR.unlockerThreeSubscriptionID,
                        Configurations_REFACTOR.unlockerFourSubscriptionID,
                        Configurations_REFACTOR.unlockerFiveSubscriptionID]
        
        let vc = LoadingVC_CXCViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
//        IAPManager.shared.validateSubscriptions_REFACTOR(productIdentifiers: products) { result in
//            if let userHaveSub = result[Configurations_REFACTOR.mainSubscriptionID] {
//                switch userHaveSub {
//                case true:
//                    let vc = LoadingVC_CXCViewController()
//                    let navController = UINavigationController(rootViewController: vc)
//                    navController.modalPresentationStyle = .fullScreen
//                    window.rootViewController = navController
//                    window.makeKeyAndVisible()
//                case false:
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//                        let unsubscribedVC = PremiumMainController()
//                        unsubscribedVC.modalPresentationStyle = .fullScreen
//                        window.rootViewController = unsubscribedVC
//                        window.makeKeyAndVisible()
//                    })
//                }
//            } else {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//                    let unsubscribedVC = PremiumMainController()
//                    unsubscribedVC.modalPresentationStyle = .fullScreen
//                    window.rootViewController = unsubscribedVC
//                    window.makeKeyAndVisible()
//                })
//            }
//        }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        Task {
            try? await Task.sleep(nanoseconds: 500_000_000)
            ThirdPartyServicesManager.shared.makeATT_REFACTOR()
        }
    }
}

