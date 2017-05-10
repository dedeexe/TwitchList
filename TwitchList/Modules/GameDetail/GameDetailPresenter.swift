//
//  GameDetailPresenter.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class GameDetailPresenter : GameDetailInterface {
    
    weak var view : GameDetailView?
    
    func getDetail(of gameInfo: GameInfo?) {
        
        guard let gameInfo = gameInfo else {
            view?.showNoGameInfo()
            return
        }
        
        view?.showGame(name:        gameInfo.game?.name)
        view?.showGame(views:       gameInfo.viewers)
        view?.showGame(channels:    gameInfo.channels)

    }
    
}
