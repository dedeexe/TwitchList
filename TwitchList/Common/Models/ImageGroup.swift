//
//  ImageGroup.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation

public struct ImageGroup : Mappable {
    
    public var large       : String?
    public var medium      : String?
    public var small       : String?
    public var template    : String?
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.large      <- map["large"]
        self.medium     <- map["medium"]
        self.small      <- map["small"]
        self.template   <- map["template"]
    }
    
}

