//
//  GameListInteractor.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import ObjectMapper

class GameListDefaultInteractor : GameListInteractorInput
{
    weak var output : GameListInteractorOutput?
    let persistService = PersistService()
    
    func searchGames(pageSize:Int=50, pageNumber:Int=0) {
        
        let gameService = GameListService(pageSize: pageSize, page: pageNumber)
        
        gameService.get { [unowned self] result in
            switch result {
                case .success(let status, let games):
                    NSLog("Game Request Status: \(status)")
                    self.output?.fetchGames(games: games)
                    self.save(gameInfoList: games)
                    return
                case .error(let err as NSError):
                    self.output?.error(code: err.code, message: err.localizedDescription)
            }
            
            let games = self.restore()
            self.output?.fetchGames(games: games)
        }
    }
    
    func save(gameInfoList:GameInfoList) {
        persistService.save(games: gameInfoList)
    }
    
    func restore() -> GameInfoList {
        return GameInfoList()
//        let games = persistService.restore()
//        var gameList = GameInfoList()
//        gameList.total = games.count
//        gameList.top = games
//        return gameList
    }
}
