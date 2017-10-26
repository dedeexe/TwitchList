//
//  CoreDataMappable.swift
//  TwitchList
//
//  Created by dede.exe on 25/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataMappable {
    init(managedObject: NSManagedObject?)
    var managedObject: NSManagedObject? { get }
}
