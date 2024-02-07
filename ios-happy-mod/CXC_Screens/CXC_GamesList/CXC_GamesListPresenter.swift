//
//  CXC_GamesListPresenter.swift
//  ios-happy-mod
//
//  Created by Maxim Stovolos on 2/5/24.
//

import Foundation
import UIKit

class CXC_GamesListPresenter {
    
//    let screenType: ScreenType
    
    let navigator: CXC_Navigator
    
    init(/*screenType: ScreenType,*/ navigator: CXC_Navigator) {
//        self.screenType = screenType
        self.navigator = navigator
    }
    
    func showMenu(vc: UIViewController /*screenType: ScreenType*/) {
        navigator.showCXC_MenuVC(view: vc/*, screenType: screenType*/)
    }
    
    func getGames() {
        
    }
    
    func getApps() {
        
    }
    
}
