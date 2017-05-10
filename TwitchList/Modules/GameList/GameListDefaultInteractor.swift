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
    
    func searchGames(pageSize:Int=50, pageNumber:Int=0) {
        
        let gameService = GameListService(pageSize: pageSize, page: pageNumber)
        
        gameService.get { [unowned self] result in
            if case .success(let status, let games) = result {
                NSLog("Game Request Status: \(status)")
                self.output?.fetchGames(games: games)
                self.save(content: games.toJSONString() ?? "", to: AppConfig.storeFile)
                return
            }
            
            let json = self.restore(from: AppConfig.storeFile)
            let games = Mapper<GameInfoList>().map(JSONString: json ?? "{}") ?? GameInfoList()
            self.output?.fetchGames(games: games)
        }
    }
    
    func save(content:String, to file:String) {
        PersistService(on: file).save(content: content)
    }
    
    func restore(from file:String) -> String? {
        return PersistService(on: file).restore()
    }
}
