//
//  GameListInteractor.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation


public protocol GameListInteractorInput : class {
    func searchGames(pageSize:Int, pageNumber:Int)
}

public protocol GameListInteractorOutput : class {
    func fetchGames(games:GameInfoList)
}
