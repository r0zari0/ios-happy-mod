//
//  CXC_Navigator.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/5/24.
//

import Foundation
import UIKit

protocol CXC_NavigatorProtocol {

}

class CXC_Navigator: CXC_NavigatorProtocol {
    
    let assembler = CXC_Assembler()
    
    func showCXC_GamesListVC(screenType: ScreenType) -> UIViewController {
        let vc = assembler.createCXC_GameList(navigator: self/*, screenType: screenType*/)
        
        return vc
    }
    
    func showCXC_ModVC(view: UIViewController, screenType: ScreenType) {
        let vc = assembler.createModVC(navigator: self, screenType: screenType)
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCXC_DetailedVC(view: UIViewController) {
        let vc = assembler.createDetailedVC(navigator: self)
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCXC_MenuVC(view: UIViewController/*, screenType: ScreenType*/) {
        let vc = assembler.createMenuVC(navigator: self/*, screenType: screenType*/)
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
}
