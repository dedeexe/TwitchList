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
    var gameInfo : GameInfo?
    
    func getDetail(of gameInfo: GameInfo?) {
        
        guard let gameInfo = gameInfo else {
            view?.showNoGameInfo()
            return
        }
        
        self.gameInfo = gameInfo
        
        view?.hideNoGameInfo()
        
        view?.showGame(name:        self.gameInfo?.game?.name)
        view?.showGame(views:       self.gameInfo?.viewers)
        view?.showGame(channels:    self.gameInfo?.channels)
        
        getLogo()
        getBanner()
        
    }
    
    
    func getLogo() {
        let service = ImageDownloadService(url: self.gameInfo?.game?.logo?.small ?? "")
        getImage(from: service) { [unowned self] image in
            self.view?.showGame(image: image)
        }
    }
    
    func getBanner() {
        let service = ImageDownloadService(url: self.gameInfo?.game?.box?.large ?? "")
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
