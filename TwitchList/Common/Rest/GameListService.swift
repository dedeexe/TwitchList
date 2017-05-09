//
//  GameListService.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public struct ShotService : Gettable {
    public typealias DataType = [Shot]
    
    public var page         : Int = 0
    public var pageSize     : Int = 5
    
    public func get(completion: @escaping (FunkingResult<DataType>) -> Void)
    {
        let url = AppConfig.baseURL.appending("/shots")
        FunkTheRest.get(url)
            .addHeader("Authorization", value: "Bearer \(AppConfig.token)")
            .addParameter("page", value: String(page))
            .addParameter("per_page", value: String(pageSize))
            .response { (result) in
                switch result {
                case .error(let err):
                    completion(FunkingResult<DataType>.error(err))
                case .success(let code, let resultData):
                    let shots = extractShots(from: resultData)
                    completion(FunkingResult<DataType>.success(code, shots))
            }
        }
    }
}

//MARK: - Helpers
fileprivate func extractShots(from input:Data) -> [Shot]
{
    var shots : [Shot] = []
    var jsonResult : [[String:Any]] = []
    
    do {
        jsonResult = try JSONSerialization.jsonObject(with: input,
                                                      options: JSONSerialization.ReadingOptions.mutableLeaves) as! [[String:Any]]
    } catch {
        return []
    }
    
    for item in jsonResult {
        shots.append(ShotFactory(jsonElement: item).create())
    }
    
    return shots
}
