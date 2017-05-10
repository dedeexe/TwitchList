//
//  GameDetailConfiguration.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class GameDetailConfiguration {
    
    static let shared : GameDetailConfiguration = {
        return GameDetailConfiguration()
    }()
    
    private init() {}
    
    func configure(view:GameDetailViewController) {
        
        let presenter = GameDetailPresenter()
        presenter.view = view
        view.presenter = presenter

    }
}
