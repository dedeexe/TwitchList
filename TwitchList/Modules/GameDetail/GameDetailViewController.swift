//
//  GameDetailViewController.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
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
    }
    
    //MARK: - Configurations
    func configureView() {
        self.navigationItem.backBarButtonItem? = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
    }
    
    
    func configureLogo() {
        gameLogoImageView.layer.cornerRadius = logoRadius
        gameLogoView.layer.cornerRadius = logoRadius
    }
    
    func configureLogoShadow() {
        gameLogoView.layer.cornerRadius = logoRadius
    }
    
    
    //MARK: - No Content Handle
    func showEmptyLabel() {
        if let _ = emptyLabel {
            return
        }
        
        emptyLabel = UILabel()
        self.view.addSubview(emptyLabel)

        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emptyLabel.text = "Nenhum conteúdo de jogo disponível."
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        emptyLabel.backgroundColor = UIColor.white


        emptyLabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        emptyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        emptyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        emptyLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func hideEmptyLabel() {
        guard let _ = emptyLabel else {
            return
        }
        
        emptyLabel.removeFromSuperview()
        emptyLabel = nil
    }
    
}


extension GameDetailViewController : GameDetailView {
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
