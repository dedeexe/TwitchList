//
//  PersistServiceTest.swift
//  TwitchList
//
//  Created by dede.exe on 10/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import TwitchList

class PersistServiceTest: XCTestCase {
    
    let filename = "persist_test.json"
    var persistText : String = ""
    
    override func setUp() {
        super.setUp()
        
        persistText = ""
        
        for _ in 1...100 {
            let value = arc4random_uniform(30000)
            persistText += String(value)
        }
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertEqual(true, PersistService(on: filename).save(content: persistText))
        
        guard let content = PersistService(on: filename).restore() else {
            XCTFail("No content restored")
            return
        }
        
        XCTAssertEqual(content, persistText)
    }
    

    
}
