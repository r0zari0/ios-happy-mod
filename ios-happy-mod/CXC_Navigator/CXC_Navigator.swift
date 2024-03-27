//MARK: - MY
import Foundation
import UIKit

class CXC_Navigator {
    
    let assembler = CXC_Assembler()
    let dropBox = CXC_Dropbox()
    
    func showCXC_GamesListVC(view: UIViewController, dropBox: CXC_Dropbox, screenType: ContentType) {
        let vc = assembler.createCXC_GameList(navigator: self, dropBox: dropBox, screenType: screenType)
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCXC_ModVC(view: UIViewController, screenType: ContentType, mod: [ModsModel_CXC]) {
        let vc = assembler.createModVC_CXC(navigator: self, dropBox: dropBox, screenType: screenType, mod: mod)
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCXC_DetailedVC(view: UIViewController, screenType: ContentType, presenter: ModsModel_CXC, image: UIImageView, realm: DataBaseManager) {
        let vc = assembler.createDetailedVC_CXC(navigator: self, realm: realm, presenter: presenter, screenType: screenType, image: image)
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCXC_MenuVC(view: UIViewController, selactedIndex: Int) {

        let vc = assembler.createMenuVC_CXC(navigator: self, dropBox: dropBox, selectedIndex: selactedIndex)
        view.navigationController?.pushViewController(vc, animated: true)
//        vc.modalPresentationStyle = .overFullScreen
//        view.present(vc, animated: true)
    }
}
