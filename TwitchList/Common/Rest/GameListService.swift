//
//  GameListService.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import ObjectMapper

public struct GameListService : Gettable {
    
    public typealias DataType = GameInfoList
    public var pageSize     : Int = 50
    public var page         : Int = 0
    
    public func get(completion: @escaping (FunkingResult<GameInfoList>) -> Void)
    {
        let url = AppConfig.baseURL.appending(EndPoint.topGames.rawValue).appending("?limit=\(pageSize)&offset=\(page)")
        
        FunkTheRest.get(url)
            .addHeader("Client-ID", value: "\(AppConfig.token)")
            .addHeader("Accept", value: "application/vnd.twitchtv.v5+json")
            .response { (result) in
                switch result {
                    case .error(let err):
                        completion(FunkingResult<DataType>.error(err))
                    case .success(let code, let resultData):
                        let games = extractGameList(from: resultData)
                        completion(FunkingResult<DataType>.success(code, games))
                }
            }
    }
}

//MARK: - Helpers
fileprivate func extractGameList(from input:Data) -> GameInfoList
{
    let jsonString = String(data: input, encoding: String.Encoding.utf8) ?? ""
    let gameList = Mapper<GameInfoList>().map(JSONString: jsonString)
    return gameList ?? GameInfoList()
}
