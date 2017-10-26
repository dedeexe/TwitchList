//
//  GameListView.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

protocol GameListView : class {
    func show(games:[Game])
    func showAlert(message:String?)
    func hideRefreshing()
}
