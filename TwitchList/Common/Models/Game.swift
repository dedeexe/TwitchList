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
    
    public var id               : Int?
   // public var box              : ImageGroup?
    public var giantBombId      : String?
    //public var logo             : ImageGroup?
    public var name             : String?
    public var popularity       : Int?
    
    public var boxLarge         : String?
    public var boxMedium        : String?
    public var boxSmall         : String?
    public var boxTemplate      : String?
    
    public var logoLarge        : String?
    public var logoMedium       : String?
    public var logoSmall        : String?
    public var logoTemplate     : String?

    public var viewers          : Int?
    public var channels         : Int?
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.id             <- map["game._id"]
        self.giantBombId    <- map["game.giantbomb_id"]
        self.name           <- map["game.name"]
        self.popularity     <- map["game.popularity"]
        
        self.boxLarge       <- map["game.box.large"]
        self.boxMedium      <- map["game.box.medium"]
        self.boxSmall       <- map["game.box.small"]
        self.boxTemplate    <- map["game.box.template"]
        
        self.logoLarge      <- map["game.logo.large"]
        self.logoMedium     <- map["game.logo.medium"]
        self.logoSmall      <- map["game.logo.small"]
        self.logoTemplate   <- map["game.logo.template"]
        
        self.viewers        <- map["viewers"]
        self.channels       <- map["channels"]
    }
}

extension Game : CoreDataMappable {
    public init(managedObject: NSManagedObject?) {
        self.id             = managedObject?.value(forKey: "id") as? Int
        self.giantBombId    = managedObject?.value(forKey: "giantBombId") as? String
        self.name           = managedObject?.value(forKey: "name") as? String
        self.popularity     = managedObject?.value(forKey: "popularity") as? Int
        
        //self.box            = ImageGroup(managedObject: managedObject?.value(forKey: "box") as? NSManagedObject)
        //self.logo           = ImageGroup(managedObject: managedObject?.value(forKey: "logo") as? NSManagedObject)
    }
    
    public var managedObject: NSManagedObject? {
        let moc = CoreDataStack.shared.managedObjectContext
        guard let entity = NSEntityDescription.entity(forEntityName: "GameEntity", in:moc) else { return nil }
        let object = NSManagedObject(entity: entity, insertInto: moc)
        
        object.setValue(id,                         forKey: "id")
        object.setValue(giantBombId,                forKey: "giantBombId")
        object.setValue(name,                       forKey: "name")
        object.setValue(popularity as NSNumber?,    forKey: "popularity")
        
        //object.setValue(box?.managedObject, forKey: "box")
        //object.setValue(logo?.managedObject, forKey: "logo")
        return object
    }
}
