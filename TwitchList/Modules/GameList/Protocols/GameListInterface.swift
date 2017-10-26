//
//  GameListInterface.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation


protocol GameListInterface : class{
    func getGames()
    func gotoGameDetail(of game:Game)
}
