//
//  ImageGroup.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation
import CoreData

public struct ImageGroup : Mappable {
    
    public var large       : String?
    public var medium      : String?
    public var small       : String?
    public var template    : String?
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.large      <- map["large"]
        self.medium     <- map["medium"]
        self.small      <- map["small"]
        self.template   <- map["template"]
    }
    
}

extension ImageGroup : CoreDataMappable {
    public init(managedObject: NSManagedObject?) {
        self.large      = managedObject?.value(forKey: "large") as? String
        self.medium     = managedObject?.value(forKey: "medium") as? String
        self.small      = managedObject?.value(forKey: "small") as? String
        self.template   = managedObject?.value(forKey: "template") as? String
    }
    
    public var managedObject: NSManagedObject? {
        let moc = CoreDataStack.shared.managedObjectContext
        guard let entity = NSEntityDescription.entity(forEntityName: "ImageGroupEntity", in:moc) else { return nil }
        let object = NSManagedObject(entity: entity, insertInto: moc)
        
        object.setValue(large,      forKey: "large")
        object.setValue(medium,     forKey: "medium")
        object.setValue(small,      forKey: "small")
        object.setValue(template,   forKey: "template")
        return object
    }
}
