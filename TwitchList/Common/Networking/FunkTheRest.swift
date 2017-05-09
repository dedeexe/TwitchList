//
//  FunkTheRest.swift
//  FunkTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation


open class FunkTheRest {
    
    fileprivate init() {}
    
    static open func get(_ url:String) -> FunkingRequest {
        let request = FunkingRequest(url: url, method:FunkingMethod.get)
        return request
    }
    
    static open func post(_ url:String) -> FunkingRequest {
        let request = FunkingRequest(url: url, method:FunkingMethod.post)
        return request
    }
    
    static open func put(_ url:String) -> FunkingRequest {
        let request = FunkingRequest(url: url, method:FunkingMethod.put)
        return request
    }
    
    static open func delete(_ url:String) -> FunkingRequest {
        let request = FunkingRequest(url: url, method:FunkingMethod.delete)
        return request
    }
    
    static open func patch(_ url:String) -> FunkingRequest {
        let request = FunkingRequest(url: url, method:FunkingMethod.patch)
        return request
    }
}
