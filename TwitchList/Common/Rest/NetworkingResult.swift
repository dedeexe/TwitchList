//
//  NetworkingResult.swift
//  TwitchList
//
//  Created by dede.exe on 08/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public enum NetworkingResult<T> {
    case success(T)
    case fail(Error)
}
