//
//  Game.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//


import ObjectMapper
import Foundation

public struct Game : Mappable {
    
    public var id              : Int?
    public var box             : ImageGroup?
    public var giantBombId     : String?
    public var logo            : ImageGroup?
    public var name            : String?
    public var popularity      : Int?
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.id             <- map["_id"]
        self.box            <- map["box"]
        self.giantBombId    <- map["giantbomb_id"]
        self.logo           <- map["logo"]
        self.name           <- map["name"]
        self.popularity     <- map["popularity"]
    }
    
}
