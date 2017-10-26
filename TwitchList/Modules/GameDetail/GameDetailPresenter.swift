//
//  GameDetailPresenter.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class GameDetailPresenter : GameDetailInterface {
    
    weak var view : GameDetailView?
    var game : Game?
    
    func getDetail(of game: Game?) {
        guard let game = game else {
            view?.showNoGameInfo()
            return
        }
        
        self.game = game
        
        view?.hideNoGameInfo()
        
        view?.showGame(name:        self.game?.name)
        view?.showGame(views:       self.game?.viewers)
        view?.showGame(channels:    self.game?.channels)
        
        getLogo()
        getBanner()
    }
    
    
    func getLogo() {
        let service = ImageDownloadService(url: self.game?.logoSmall ?? "")
        getImage(from: service) { [unowned self] image in
            self.view?.showGame(image: image)
        }
    }
    
    func getBanner() {
        let service = ImageDownloadService(url: self.game?.boxLarge ?? "")
        getImage(from: service) { [unowned self] image in
            self.view?.showGame(banner: image)
        }
    }
    
    func getImage<Service:Gettable>(from service : Service, completion:@escaping (UIImage?)->Void) where Service.DataType == UIImage? {
        service.get { result in
            if case .success(_, let content) = result {
                completion(content)
                return
            }
            
            completion(nil)
        }
    }
    
}
