//
//  GameDetailInterface.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol GameDetailInterface : class {
    
    func getDetail(of gameInfo:GameInfo?)
    
}
