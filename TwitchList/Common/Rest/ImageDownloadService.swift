//
//  ImageDownloadService.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

struct ImageDownloadService : Gettable {
    
    typealias DataType = UIImage?
    
    private var imageURL : String?
    
    init(url:String) {
        imageURL = url
    }
    
    public func get(completion: @escaping (FunkingResult<UIImage?>) -> Void) {
        
        guard let url = self.imageURL else {
            completion(FunkingResult<DataType>.success(HttpStatusCode.ok.rawValue, nil))
            return
        }
        
        FunkTheRest.get(url)
            .response { (result) in
                switch result {
                    case .error(let err):
                        completion(FunkingResult<DataType>.error(err))
                    case .success(let code, let resultData):
                        let image = UIImage(data: resultData)
                        completion(FunkingResult<DataType>.success(code, image))
                }
            }
    }
    
}
