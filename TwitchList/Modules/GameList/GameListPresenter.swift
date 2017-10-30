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
    var pageSize = 60
    var offset = 0
    
    var games : [Game] = []
    var pullRefresh : Bool = false
    
    func getGames() {
        
        if firstTime {
            CoreDataStack.onInit = {[unowned self] in
                self.input?.searchGames(pageSize: self.pageSize, pageNumber: self.offset)
            }
            _ = CoreDataStack.shared
            firstTime = false
            return
        }
        
        input?.searchGames(pageSize: pageSize, pageNumber: offset)
    }
    
    func getFirstsGames() {
        pullRefresh = true
        offset = 0
        getGames()
    }
    
    func gotoGameDetail(of game: Game) {
        router?.gotoGameDetail(of: game)
    }
    
    public func fetchGames(games: GameInfoList) {
        let gameList = games.top ?? []
        
        if pullRefresh {
            self.games.removeAll()
            pullRefresh = false
        }
        
        self.games.append(contentsOf: gameList)
        offset = self.games.count
        
        view?.show(games: self.games)
        view?.hideRefreshing()
    }

    public func error(code: Int, message: String?) {
        view?.showAlert(message: message)
        view?.hideRefreshing()
    }
    
}
