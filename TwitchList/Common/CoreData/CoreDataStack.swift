//
//  CoreDataStack.swift
//  TwitchList
//
//  Created by dede.exe on 25/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack : NSObject{
    
    typealias completion = () -> ()?
    
    static let shared : CoreDataStack = {
        let instance = CoreDataStack(completionClosure: CoreDataStack.onInit)
        return instance
    }()
    
    static var onInit : () -> () = {}
    
    var managedObjectContext: NSManagedObjectContext
    
    private init(completionClosure: @escaping () -> ()) {
        
        guard let modelURL = Bundle.main.url(forResource: "GamesModel", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing model mom from \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        super.init()
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve documentDirectory")
            }
            
            let storyURL = docURL.appendingPathComponent("GamesModel.sqlite")
            
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storyURL, options: nil)
                DispatchQueue.main.sync(execute: completionClosure)
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
        
    }
}
