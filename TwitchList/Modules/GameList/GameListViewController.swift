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
    var games : [Game] = []
    var refreshControl : UIRefreshControl!
    let justOneSection = 1
    let offsetPage = 20
    
    var contentSize = CGSize(width: 0, height: 0)
    
    @IBOutlet weak var collectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadConfigurations()
        presenter?.getGames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Configurations
    func loadConfigurations() {
        GameListConfigurator.shared.configure(view: self)
        contentSize = collectionView.frame.size
        configureCells()
        configureTableView()
        configureView()
        configureRefreshControl()
    }
    
    func configureCells() {
        let identifier = String(describing: GameContentCell.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func configureTableView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configureView() {
        self.title = "Jogos Mais Populares"
    }
    
    func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    func refreshHandler() {
        presenter?.getFirstsGames()
    }
    
}

//MARK: - GameListView Implementations
extension GameListViewController : GameListView {
    func show(games: [Game]) {
        self.games = games
        
        DispatchQueue.main.async { [unowned self] in
            self.collectionView.reloadData()
        }
    }
    
    func showAlert(message: String?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(button)
        
        DispatchQueue.main.async { [unowned self] in
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideRefreshing() {
        DispatchQueue.main.async { [unowned self] in
            self.refreshControl.endRefreshing()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentSize = collectionView.frame.size
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

//MARK: - TableView DataSource And Delegate
extension GameListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: -- DataSource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return justOneSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: GameContentCell.self)
        
        let game = games[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? GameContentCell else {
            let defaultCell = UICollectionViewCell()
            return defaultCell
        }

        cell.tag = indexPath.row
        cell.gameNameLabel.text = game.name

        ImageDownloadService(url: game.boxLarge ?? "").get { result in
            if case .success(_, let content) = result {
                DispatchQueue.main.async {
                    if cell.tag == indexPath.row {
                        cell.gameImageView.image = content
                    }
                }
            }
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = games[indexPath.row]
        presenter?.gotoGameDetail(of: game)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = contentSize.width
        let width = (collectionWidth / 2) - 20
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (self.games.count - offsetPage) {
            presenter?.getGames()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
