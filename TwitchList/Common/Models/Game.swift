//
//  Game.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//


import ObjectMapper
import Foundation

struct Game : Mappable {
    
    var id              : Int?
    var box             : ImageGroup?
    var giantBombId     : String?
    var logo            : ImageGroup?
    var name            : String?
    var popularity      : Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.id             <- map["_id"]
        self.box            <- map["box"]
        self.giantBombId    <- map["giantbomb_id"]
        self.logo           <- map["logo"]
        self.name           <- map["name"]
        self.popularity     <- map["popularity"]
    }
    
}
