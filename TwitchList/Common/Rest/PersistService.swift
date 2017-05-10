//
//  PersistService.swift
//  TwitchList
//
//  Created by dede.exe on 10/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class PersistService {
    
    let filename : String
    
    var fullFilename : String {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        return dirPath + "/" + filename
    }
    
    init(on filename:String) {
        self.filename = filename
    }
    
    @discardableResult func save(content:String) -> Bool {
        guard let _ = try? content.write(toFile: fullFilename, atomically: true, encoding: .utf8) else {
            return false
        }
        
        return true
    }
    
    func restore() -> String? {
        let result = try? String(contentsOfFile: fullFilename)
        return result
    }
    
}
