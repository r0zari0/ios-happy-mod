//
//  CXC_Assembler.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/5/24.
//

import Foundation
import UIKit

class CXC_Assembler {
    
    func createCXC_GameList(navigator: CXC_Navigator/*, screenType: ScreenType*/) -> UIViewController {
        let presenter = CXC_GamesListPresenter(/*screenType: screenType,*/ navigator: navigator)
        let vc = CXC_GamesListViewController(presenter: presenter/*, screenType: screenType*/)
        
        return vc
    }
    
    func createModVC(navigator: CXC_Navigator, screenType: ScreenType) -> UIViewController {
        let presenter = CXC_ModsPresenter(navigator: navigator)
        let vc = CXC_ModsVC(presenter: presenter)
        
        return vc
    }
    
    func createDetailedVC(navigator: CXC_Navigator) -> UIViewController {
        let presenter = CXC_DetailedPresenter(navigator: navigator)
        let vc = CXC_DetailedVC(presenter: presenter)
        
        return vc
    }
    
    func createMenuVC(navigator: CXC_Navigator/*, screenType: ScreenType*/) -> UIViewController {
        let presenter = CXC_MenuPresenter(navigator: navigator)
        let vc = CXC_MenuVC(presenter: presenter)
        
        return vc
    }
}
