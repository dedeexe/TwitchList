//
//  GameListViewController.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController  {
    
    var presenter : GameListInterface?
    var games : [GameInfo] = []
    var refreshControl : UIRefreshControl!
    
    let justOneSection = 1
    
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadConfigurations()
        presenter?.getGames()
        
        print(NSHomeDirectory())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Configurations
    func loadConfigurations() {
        GameListConfigurator.shared.configure(view: self)
        configureCells()
        configureTableView()
        configureView()
        configureRefreshControl()
    }
    
    func configureCells() {
        let identifier = String(describing: GameCell.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureView() {
        self.title = "Jogos Mais Populares"
    }
    
    func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func refreshHandler() {
        presenter?.getGames()
    }
    
}

//MARK: - GameListView Implementations
extension GameListViewController : GameListView {
    func show(games: [GameInfo]) {
        self.games = games
        
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}



//MARK: - TableView DataSource And Delegate
extension GameListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    //MARK: -- DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return justOneSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: GameCell.self)
        
        let gameInfo = games[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? GameCell else {
            let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            defaultCell.textLabel?.text = gameInfo.game?.name
            defaultCell.selectionStyle = .none
            return defaultCell
        }
        
        cell.selectionStyle = .none
        cell.gameNameLabel.text = gameInfo.game?.name
        return cell
    }
    
    
    //MARK: -- Delegate Methods 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let game = games[indexPath.row]
        presenter?.gotoGameDetail(of: game)
    }
}
