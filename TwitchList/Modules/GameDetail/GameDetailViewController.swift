//
//  GameDetailViewController.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    var gameInfo : GameInfo?
    
    var presenter : GameDetailInterface?
    
    @IBOutlet weak var gameTitleLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


extension GameDetailViewController : GameDetailView {
    func showNoGameInfo() {
        
    }
    
    func showGame(name: String?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameTitleLabel.text = name
        }
    }

    func showGame(views: Int?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameTitleLabel.text = ""
        }
    }
    
    func showGame(channels: Int?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameTitleLabel.text = ""
        }
    }
    
    func showGame(image: UIImage?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameTitleLabel.text = ""
        }
    }
    
    func showGame(banner: UIImage?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameTitleLabel.text = ""
        }
    }
    
}
