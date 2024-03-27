
import Foundation
import UIKit

private func kdfas_DFsdf(qwop: Int) {
 let asdfö = qwop * 2
}

enum BackButtonType_CXC {
    case back
    case cancel
    case close
    case clear
}

enum UINavigationBarAppearanceType_CXC {
    case defaultAppear
    case opaque
    case transparent

    var backImage: UIImage {
        return UIImage(named: "backArrow")!
    }
}

private var actionKey: Void?

extension UIViewController {

    private var _action: () -> Void {
        get {
            return objc_getAssociatedObject(self, &actionKey) as! () -> Void
        }
        set {
            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }


    private func customNavBarAppearance_CXC(
        _ type: UINavigationBarAppearanceType_CXC,
        titleColor: UIColor = .white,
        largeTitleColor: UIColor = .white,
        buttonColor: UIColor = .white,
        fontTitle: UIFont = UIFont.systemFont(ofSize: 24),
        backButtonText: String = ""
    ) -> UINavigationBarAppearance {
        let customNavBarAppearance = UINavigationBarAppearance()

        // set type nav bar
        switch type {
        case .defaultAppear:
            customNavBarAppearance.configureWithDefaultBackground()
            customNavBarAppearance.backgroundColor = .systemBackground
        case .opaque:
            customNavBarAppearance.configureWithOpaqueBackground()
            customNavBarAppearance.backgroundColor = .systemBackground
        case .transparent:
            customNavBarAppearance.configureWithTransparentBackground()
            customNavBarAppearance.backgroundColor = .systemBackground
        }

        // Apply colored, font normal and large titles.
        customNavBarAppearance.titleTextAttributes = [
            .foregroundColor: titleColor,
            .font: fontTitle
        ]
        customNavBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: largeTitleColor
        ]

        // Apply white color to all the nav bar buttons.
        let barButtonItemAppearance = UIBarButtonItemAppearance(style: .plain)

        barButtonItemAppearance.normal.titleTextAttributes = [.foregroundColor: buttonColor]
        barButtonItemAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.lightText]
        barButtonItemAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.label]
        barButtonItemAppearance.focused.titleTextAttributes = [.foregroundColor: buttonColor]

        let backBarButtonItemAppearance = UIBarButtonItemAppearance(style: .plain)

        backBarButtonItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        backBarButtonItemAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.white]
        backBarButtonItemAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.white]
        backBarButtonItemAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.white]


        customNavBarAppearance.buttonAppearance = barButtonItemAppearance
        customNavBarAppearance.backButtonAppearance = backBarButtonItemAppearance
        customNavBarAppearance.doneButtonAppearance = barButtonItemAppearance

        UINavigationBar.appearance().tintColor = .white


        // change text with back button

        return customNavBarAppearance
    }

    func setNavigationStackCustomNavBar(type: UINavigationBarAppearanceType_CXC) {
        let newAppearance = customNavBarAppearance_CXC(type)

        navigationController!.navigationBar.scrollEdgeAppearance = newAppearance
        navigationController!.navigationBar.compactAppearance = newAppearance
        navigationController!.navigationBar.standardAppearance = newAppearance

        if #available(iOS 15.0, *) {
            navigationController!.navigationBar.compactScrollEdgeAppearance = newAppearance
        }
    }

    func setUIAppearanceCustomNavBar(type: UINavigationBarAppearanceType_CXC) {
        let newAppearance = customNavBarAppearance_CXC(type)

        UINavigationBar.appearance().scrollEdgeAppearance = newAppearance
        UINavigationBar.appearance().compactAppearance = newAppearance
        UINavigationBar.appearance().standardAppearance = newAppearance

        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().compactScrollEdgeAppearance = newAppearance
        }
    }


    func setLocalCustomNavBar(type: UINavigationBarAppearanceType_CXC) {
        let newAppearance = customNavBarAppearance_CXC(type)

        navigationItem.scrollEdgeAppearance = newAppearance
        navigationItem.compactAppearance = newAppearance
        navigationItem.standardAppearance = newAppearance

        if #available(iOS 15.0, *) {
            navigationItem.compactScrollEdgeAppearance = newAppearance
        }
    }

    func addCustomizeNavigationBackButton(type: BackButtonType_CXC, completion: @escaping () -> Void) {
        var backButton = UIBarButtonItem()
        _action = completion
        switch type {
        case .cancel:
            let text = "Cancel"
            backButton = UIBarButtonItem(title: text, style: .plain, target: self, action: #selector(pressed))
        case .back:
            let image = UIImage(named: "backArrow")?.withRenderingMode(.alwaysOriginal)
            backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(pressed))
        case .close:
            let image = UIImage(named: "close")
            backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(pressed))
        case .clear:
            backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        }

        backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .normal)
        navigationItem.leftBarButtonItem = backButton
    }

    @objc
    private func pressed(sender: UIBarButtonItem) {
        _action()
    }
}
