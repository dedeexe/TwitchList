 //
//  Gettable.swift
//  TwitchList
//
//  Created by dede.exe on 08/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol Gettable {
    associatedtype DataType
    func get(completion: @escaping (FunkingResult<DataType>) -> Void)
}

