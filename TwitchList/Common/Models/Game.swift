//
//  Game.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import Foundation
import CoreData

public struct Game : Mappable {
    
    public var id              : Int?
    public var box             : ImageGroup?
    public var giantBombId     : String?
    public var logo            : ImageGroup?
    public var name            : String?
    public var popularity      : Int?
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.id             <- map["_id"]
        self.box            <- map["box"]
        self.giantBombId    <- map["giantbomb_id"]
        self.logo           <- map["logo"]
        self.name           <- map["name"]
        self.popularity     <- map["popularity"]
    }
}

extension Game : CoreDataMappable {
    public init(managedObject: NSManagedObject?) {
        self.id             = managedObject?.value(forKey: "id") as? Int
        self.giantBombId    = managedObject?.value(forKey: "giantBombId") as? String
        self.name           = managedObject?.value(forKey: "name") as? String
        self.popularity     = managedObject?.value(forKey: "popularity") as? Int
        
        self.box            = ImageGroup(managedObject: managedObject?.value(forKey: "box") as? NSManagedObject)
        self.logo           = ImageGroup(managedObject: managedObject?.value(forKey: "logo") as? NSManagedObject)
    }
    
    public var managedObject: NSManagedObject? {
        let moc = CoreDataStack.shared.managedObjectContext
        guard let entity = NSEntityDescription.entity(forEntityName: "GameEntity", in:moc) else { return nil }
        let object = NSManagedObject(entity: entity, insertInto: moc)
        
        object.setValue(id,                         forKey: "id")
        object.setValue(giantBombId,                forKey: "giantBombId")
        object.setValue(name,                       forKey: "name")
        object.setValue(popularity as NSNumber?,    forKey: "popularity")
        
        object.setValue(box?.managedObject, forKey: "box")
        object.setValue(logo?.managedObject, forKey: "logo")
        return object
    }
}
