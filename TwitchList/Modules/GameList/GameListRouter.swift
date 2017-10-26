//
//  GameListRouter.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit


class GameListRouter : GameListWireframe {
    
    private weak var viewController : GameListViewController?
    
    init(viewController reference : GameListViewController) {
        viewController = reference
    }
    
    func gotoGameDetail(of game: Game) {
        guard let vc = viewController?.storyboard?.instantiateViewController(withIdentifier: "GameDetail") as? GameDetailViewController else {
            return
        }
        
        guard let splitController = viewController?.splitViewController else {
            return
        }
        
        vc.gameInfo = game
        splitController.showDetailViewController(vc, sender:nil)
    }
    
}
