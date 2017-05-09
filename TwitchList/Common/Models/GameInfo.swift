//
//  GameInfo.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation

struct GameInfo : Mappable {
    
    var channels    : Int?
    var viewers     : ImageGroup?
    var game        : Game?

    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.channels   <- map["channels"]
        self.viewers    <- map["viewers"]
        self.game       <- map["game"]
    }
    
}
