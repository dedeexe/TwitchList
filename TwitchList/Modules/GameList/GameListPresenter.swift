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
    var canMakeRequest = true
    
    var canPaginate : Bool {
        return InternetCheck().isConnected
    }
    
    var internetCheckTimer : Timer?
    
    func initialize() {
        internetCheckTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(checkInternet), userInfo: nil, repeats: true)
    }
    
    func getGames() {
        
        if firstTime {
            CoreDataStack.onInit = {[unowned self] in
                self.input?.searchGames(pageSize: self.pageSize, pageNumber: self.offset)
            }
            _ = CoreDataStack.shared
            firstTime = false
            return
        }
        
        guard canPaginate else { return }
        input?.searchGames(pageSize: pageSize, pageNumber: offset)
    }
    
    func getFirstsGames() {
        canMakeRequest = false
        pullRefresh = true
        offset = 0
        getGames()
    }
    
    func gotoGameDetail(of game: Game) {
        router?.gotoGameDetail(of: game)
    }
    
    public func fetchGames(games: GameInfoList, fromDatabase storage: Bool) {
        let gameList = games.top ?? []
        
        if pullRefresh || storage {
            self.games.removeAll()
            pullRefresh = false
        }
        
        canMakeRequest = true
        self.games.append(contentsOf: gameList)
        offset = self.games.count
        
        view?.show(games: self.games)
        view?.hideRefreshing()
    }

    public func error(code: Int, message: String?) {
        view?.showAlert(message: message)
        view?.hideRefreshing()
    }
    
    func initializeTimer() {
        internetCheckTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(checkInternet), userInfo: nil, repeats: true)
    }
    
    @objc func checkInternet(sender:Timer) {
        self.view?.show(internetAlert: !InternetCheck().isConnected)
    }
}
