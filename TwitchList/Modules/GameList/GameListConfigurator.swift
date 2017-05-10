//
//  GameListConfigurator.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation


class GameListConfigurator {
    
    static let shared : GameListConfigurator = {
        return GameListConfigurator()
    }()
    
    private init() {}
    
    func configure(view : GameListViewController) {
        let presenter = GameListPresenter()
        presenter.view = view
        view.presenter = presenter
        
        let input = GameListDefaultInteractor()
        presenter.input = input
        input.output = presenter
        
        let router = GameListRouter(viewController: view)
        presenter.router = router
    }
    
}
