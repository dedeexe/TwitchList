//
//  FunkingHelpers.swift
//  FunkTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

internal func extractStringFromData(data:Data) -> String {
    guard let convertedString = String(data: data, encoding: .utf8) else {
        return ""
    }
    
    return convertedString
}
