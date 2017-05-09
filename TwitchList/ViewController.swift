//
//  ViewController.swift
//  TwitchList
//
//  Created by dede.exe on 01/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let game = GameListService()
        
        game.get { result in
            if case .success(let status , let value) = result {
                print(status)
                dump(value)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

