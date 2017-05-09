//
//  GameInfoList.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation

public struct GameInfoList : Mappable {
    
    public var total       : Int?
    public var top         : [GameInfo]?
    
    public init() {
        total = 0
        top = []
    }
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.total  <- map["_total"]
        self.top    <- map["top"]
    }
    
}
