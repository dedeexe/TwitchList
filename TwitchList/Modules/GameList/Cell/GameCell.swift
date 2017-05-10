//
//  GameCell.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet weak var gameNameLabel : UILabel!
    @IBOutlet weak var containerView : UIView!
    @IBOutlet weak var gameImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        loadConfigurations()
    }
    
    
    func loadConfigurations() {
        configureContainer()
    }
    
    
    func configureContainer() {
        //containerView.backgroundColor = UIColor.
        containerView.layer.cornerRadius = 5.0
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
