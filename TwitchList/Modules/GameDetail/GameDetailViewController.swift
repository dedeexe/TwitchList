//
//  GameDetailViewController.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController, GameDetailView {
    
    var gameInfo    : GameInfo?
    var presenter   : GameDetailInterface?
    var emptyLabel  : UILabel!
    
    let logoRadius = CGFloat(15.0)
    
    @IBOutlet weak var gameTitleLabel       : UILabel!
    @IBOutlet weak var gameChannelsLabel    : UILabel!
    @IBOutlet weak var gameViewsLabel       : UILabel!
    
    @IBOutlet weak var shadowView           : UIView!
    @IBOutlet weak var gameLogoView         : UIView!
    @IBOutlet weak var gameLogoImageView    : UIImageView!
    @IBOutlet weak var gameBannerImageView  : UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadConfigurations()
        showEmptyLabel()
        presenter?.getDetail(of: gameInfo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadConfigurations() {
        GameDetailConfiguration.shared.configure(view: self)
        configureView()
        configureLogo()
        configureLogoShadow()
    }
    
    //MARK: - Configurations
    func configureView() {
        self.title = "Detalhes"
    }
    
    
    func configureLogo() {
        gameLogoImageView.layer.cornerRadius = logoRadius
        gameLogoView.layer.cornerRadius = logoRadius
    }
    
    func configureLogoShadow() {
        //shadowView.layer.cornerRadius = logoRadius
        shadowView.backgroundColor = UIColor.clear
        
        shadowView.layer.shadowRadius = 15.0
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        shadowView.layer.masksToBounds = false
        
    }
    
    func showEmptyLabel() {
        DispatchQueue.main.async {[unowned self] in
            
            if let _ = self.emptyLabel {
                return
            }
            
            self.emptyLabel = UILabel()

            self.emptyLabel.translatesAutoresizingMaskIntoConstraints = false
            
            self.emptyLabel.text = "Nenhum conteúdo de jogo disponível."
            self.emptyLabel.numberOfLines = 0
            self.emptyLabel.textAlignment = .center
            self.emptyLabel.backgroundColor = UIColor.white

            self.view.addSubview(self.emptyLabel)
            self.emptyLabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.emptyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            self.emptyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            self.emptyLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
        }
    }
    
    func hideEmptyLabel() {
        DispatchQueue.main.async {[unowned self] in
            guard let _ = self.emptyLabel else {
                return
            }
            
            self.emptyLabel.removeFromSuperview()
            self.emptyLabel = nil
        }
    }
    

    //
    //MARK: - GameDetailView
    //
    
    func showNoGameInfo() {
        showEmptyLabel()
    }

    func hideNoGameInfo() {
        hideEmptyLabel()
    }
    
    func showGame(name: String?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameTitleLabel.text = name
        }
    }

    func showGame(views: Int?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameViewsLabel.text = "\(views ?? 0)"
        }
    }
    
    func showGame(channels: Int?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameChannelsLabel.text = "\(channels ?? 0)"
        }
    }
    
    func showGame(image: UIImage?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameLogoImageView.image = image
        }
    }
    
    func showGame(banner: UIImage?) {
        DispatchQueue.main.async { [unowned self] in
            self.gameBannerImageView.image = banner
        }
    }
}
