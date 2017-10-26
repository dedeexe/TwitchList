//
//  GameInfo.swift
//  TwitchList
//
//  Created by dede.exe on 09/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import ObjectMapper
import UIKit
import CoreData

public struct GameInfo : Mappable {
    
    public var channels    : Int?
    public var viewers     : Int?
    public var game        : Game?

    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        self.channels   <- map["channels"]
        self.viewers    <- map["viewers"]
        self.game       <- map["game"]
    }
    
}

extension GameInfo : CoreDataMappable {
    public init(managedObject: NSManagedObject?) {
        self.channels   = managedObject?.value(forKey: "channels") as? Int
        self.viewers    = managedObject?.value(forKey: "viewers") as? Int
        self.game       = Game(managedObject: managedObject?.value(forKey: "game") as? NSManagedObject)
    }
    
    public var managedObject: NSManagedObject? {
        let moc = CoreDataStack.shared.managedObjectContext
        guard let entity = NSEntityDescription.entity(forEntityName: "GameInfoEntity", in:moc) else { return nil }
        let object = NSManagedObject(entity: entity, insertInto: moc)
        
        object.setValue(viewers,                forKey: "viewers")
        object.setValue(channels,               forKey: "channels")
        object.setValue(game?.managedObject,    forKey: "game")
        return object
    }
}
