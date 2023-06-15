//
//  Persistent.swift
//  TweetApp2
//
//  Created by itakura shouho on 2023/06/15.
//

import CoreData

struct PersistenceController{
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name:"Tweet")
        
        container.loadPersistentStores(completionHandler: { (storeDescription,error) in
            if let error = error as NSError?{
                fatalError("Unresolved error \(error)")
            }
        })
    }
    
    
}
