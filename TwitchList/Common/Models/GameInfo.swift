//
//  GameInfo.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation

public struct GameInfo : Mappable {
    
    public var channels    : Int?
    public var viewers     : Int?
    public var game        : Game?

    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.channels   <- map["channels"]
        self.viewers    <- map["viewers"]
        self.game       <- map["game"]
    }
    
}
