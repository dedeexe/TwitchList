//
//  GameListInteractor.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class GameListDefaultInteractor : GameListInteractorInput
{
    weak var output : GameListInteractorOutput?
    
    func searchGames(pageSize:Int=50, pageNumber:Int=0) {
        
        let gameService = GameListService(pageSize: pageSize, page: pageNumber)
        
        gameService.get { [unowned self] result in
            if case .success(let status, let games) = result {
                NSLog("Game Request Status: \(status)")
                self.output?.fetchGames(games: games)
            }
        }
    }
}
