//
//  GameInfoList.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation

struct GameInfoList : Mappable {
    
    var total       : Int?
    var top         : [GameInfo]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.total  <- map["_total"]
        self.top    <- map["top"]
    }
    
}
