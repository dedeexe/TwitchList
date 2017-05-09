//
//  ImageGroup.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation

struct ImageGroup : Mappable {
    
    var large       : String?
    var medium      : String?
    var small       : String?
    var template    : String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.large      <- map["large"]
        self.medium     <- map["medium"]
        self.small      <- map["small"]
        self.template   <- map["template"]
    }
    
}

