//
//  GameListRouter.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit


class GameListRouter : GameListWireframe {
    
    private weak var viewController : UIViewController?
    
    
    func gotoGameDetail(game: GameInfo) {
        let vc = viewController?.storyboard?.instantiateViewController(withIdentifier: "GameDetail")
    }
    
}
