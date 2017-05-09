//
//  FunkingRequest.swift
//  FunkTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

open class FunkingRequest {
    
    let url:URL
    let method : String
    var parameters : [String:String]    = [:]
    var headers : [String:String]       = [:]
    
    fileprivate var request : URLRequest
    {
        var fieldParams:[String] = []
        var urlRequest = URLRequest(url: self.url)
        urlRequest.httpMethod = method
        
        for (key,value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        for (key,value) in parameters {
            let paramValue = "\(key)=\(value)"
            fieldParams.append(paramValue)
        }
        
        let paramsString = fieldParams.joined(separator: "&")
        urlRequest.httpBody = paramsString.data(using:.utf8)
        return urlRequest
    }
    
    public init(url:String, methodName:String) {
        self.url = URL(string:url)!
        self.method = methodName
    }
    
    convenience public init(url:String, method:FunkingMethod) {
        self.init(url:url, methodName:method.rawValue)
    }
    
    open func header(_ fields:[String:String]) {
        self.headers = fields
    }
    
    open func addHeader(_ key:String, value:String) -> FunkingRequest {
        self.headers[key] = value
        return self
    }
    
    open func parameters(_ fields:[String:String]) {
        self.headers = fields
    }
    
    open func addParameter(_ key:String, value:String) -> FunkingRequest {
        self.parameters[key] = value
        return self
    }
    
}

extension FunkingRequest
{
    open func response(completion:@escaping (FunkingResult<Data>) -> Void) {
        let requestEntity = self.request
        let responseEntity = FunkingResponse(request: requestEntity)
        responseEntity.getData(completion: completion)
    }
    
    open func responseString(completion:@escaping (FunkingResult<String>) -> Void) {
        let requestEntity = self.request
        let responseEntity = FunkingResponse(request: requestEntity)
        responseEntity.getData { (resultData) in
            let stringResult = resultData.map(extractStringFromData)
            completion(stringResult)
        }
    }
}
