//
//  GameListWireframe.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol GameListWireframe : class {
    func gotoGameDetail(of game:Game)
}
