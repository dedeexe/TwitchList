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
                    print("Falha ao salvos Jogos!")
                }
            }
        }
    }
    
    func restore() -> [Game] {
        let moc = CoreDataStack.shared.managedObjectContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "GameEntity")
        let sort = NSSortDescriptor(key: "timestamp", ascending: true)
        fetchRequest.sortDescriptors = [sort]

        do {
            guard let games = try moc.fetch(fetchRequest) as? [NSManagedObject] else { return [] }
            let convertedGames = games.flatMap{ Game(managedObject: $0) }
            return convertedGames
        } catch {
            return []
        }
    }
    
}
