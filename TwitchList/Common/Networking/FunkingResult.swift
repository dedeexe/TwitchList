//
//  FunkingResult.swift
//  FunkTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public enum FunkingResult<T> {
    case success(Int, T)
    case error(Error)
}

public extension FunkingResult {
    public func map<U>(_ fnc:(T) -> U) -> FunkingResult<U>
    {
        switch self {
            case .success(let statusCode, let resultValue):
                let mappedResult = fnc(resultValue)
                return FunkingResult<U>.success(statusCode, mappedResult)
            case .error(let error):
                return FunkingResult<U>.error(error)
        }
    }
}
