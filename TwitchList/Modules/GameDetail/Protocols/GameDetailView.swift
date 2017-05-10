//
//  GameDetailView.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit


public protocol GameDetailView : class {
    
    func showGame(name:String?)
    func showGame(views:Int?)
    func showGame(channels:Int?)
    func showGame(image:UIImage?)
    func showGame(banner:UIImage?)
    
    func showNoGameInfo()
    func hideNoGameInfo()
    
}
