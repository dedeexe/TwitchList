//
//  GameDetailViewControllerTests.swift
//  TwitchList
//
//  Created by dede.exe on 10/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import TwitchList
import ObjectMapper

class GameDetailViewControllerTests: XCTestCase {
    
    var viewController : GameDetailViewController!
    
    
    override func setUp() {
        super.setUp()
        viewController = GameDetailConfiguration.shared.setupGameDetailController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testComponentsReference() {
        
        let _ = viewController.view
        
        XCTAssertNotNil(viewController.gameTitleLabel)
        XCTAssertNotNil(viewController.gameChannelsLabel)
        XCTAssertNotNil(viewController.gameViewsLabel)
        XCTAssertNotNil(viewController.shadowView)
        XCTAssertNotNil(viewController.gameLogoView)
        XCTAssertNotNil(viewController.gameLogoImageView)
        XCTAssertNotNil(viewController.gameBannerImageView)
        
    }

    func testGameDetailFulfill() {

        let gameDetail = GameDetailConfiguration.shared.generateGameInfo()
        
        viewController.gameInfo = gameDetail
        let _ = viewController.view
        
    }
    
}


class GameDetailMockedPresenter : GameDetailPresenter {
    
    override func getDetail(of gameInfo: GameInfo?) {
        
        XCTAssertEqual(gameInfo?.viewers, 10)
        XCTAssertEqual(gameInfo?.channels, 10)
        XCTAssertEqual(gameInfo?.game?.name, "Test Game")
        
        super.getDetail(of: gameInfo)
    }
    
    override func getLogo() {
        self.view?.showGame(image: UIImage())
    }
    
    override func getBanner() {
        self.view?.showGame(banner: UIImage())
    }
}

extension GameDetailConfiguration {
    
    func configure(view:GameDetailViewController) {
        let presenter = GameDetailMockedPresenter()
        presenter.view = view
        view.presenter = presenter
    }
    
    func setupGameDetailController() -> GameDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GameDetail") as! GameDetailViewController
        return vc
    }

    
    func generateGameInfo() -> GameInfo? {
        var gameInfo = GameInfo(JSONString: "{}")
        gameInfo?.channels = 10
        gameInfo?.viewers = 10
        gameInfo?.game = generateGame()
        
        return gameInfo
    }
    
    func generateGame() -> Game? {
        var game = Game(JSONString: "{}")
        game?.box = generateImageGroup()
        game?.logo = generateImageGroup()
        game?.id = 10
        game?.giantBombId = "XXX"
        game?.popularity = 10
        game?.name = "Test Game"
        
        return game
    }
    
    func generateImageGroup() -> ImageGroup? {
        var images = ImageGroup(JSONString: "{}")
        images?.small = "small"
        images?.medium = "medium"
        images?.large = "large"
        images?.template = "template"
        
        return images
    }

}
