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
    var firstTime : Bool = true
    
    func getGames() {
        
        if firstTime {
            CoreDataStack.onInit = {[weak self] in
                self?.input?.searchGames(pageSize: 50, pageNumber: 0)
            }
            _ = CoreDataStack.shared
            firstTime = false
            return
        }
        
        input?.searchGames(pageSize: 50, pageNumber: 0)
    }
    
    func gotoGameDetail(of game: GameInfo) {
        router?.gotoGameDetail(of: game)
    }
    
    public func fetchGames(games: GameInfoList) {
        let gameList = games.top ?? []
        view?.show(games: gameList)
        view?.hideRefreshing()
    }

    public func error(code: Int, message: String?) {
        view?.showAlert(message: message)
        view?.hideRefreshing()
    }
    
}
