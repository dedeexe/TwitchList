//
//  PersistService.swift
//  TwitchList
//
//  Created by dede.exe on 10/05/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit
import CoreData

class PersistService {
    
    init() {}
    
    func save(games:GameInfoList) {
        guard let gamesInfo = games.top else { return }
        let moc = CoreDataStack.shared.managedObjectContext
        if gamesInfo.count < 0 { return }
        
        DispatchQueue.main.async {
            for gameInfo in gamesInfo {
                if let managedGame = gameInfo.managedObject {
                    moc.insert(managedGame)
                }
            }
            
            if !moc.hasChanges {
                return
            }
            
            moc.performAndWait{
                do {
                    try moc.save()
                    print("Jogos salvos com sucesso!")
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func restore() -> [GameInfo] {
        let moc = CoreDataStack.shared.managedObjectContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "GameInfoEntity")
        
        do {
            guard let games = try moc.fetch(fetchRequest) as? [NSManagedObject] else { return [] }
            let convertedGames = games.flatMap{ GameInfo(managedObject: $0) }
            return convertedGames
        } catch {
            return []
        }
        
        return []
    }
    
}
