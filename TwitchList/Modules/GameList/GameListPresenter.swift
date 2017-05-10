//
//  GameListDefaultPresenter.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation


public class GameListPresenter : GameListInterface, GameListInteractorOutput {
    
    weak var view : GameListView?
    var input : GameListInteractorInput?
    var router : GameListWireframe?
    
    func getGames() {
        input?.searchGames(pageSize: 50, pageNumber: 0)
    }
    
    func gotoGameDetail(of game: GameInfo) {
        router?.gotoGameDetail(of: game)
    }
    
    public func fetchGames(games: GameInfoList) {
        let gameList = games.top ?? []
        view?.show(games: gameList)
    }

}
