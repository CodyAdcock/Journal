//
//  EntryController.swift
//  Journal
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class EntryController{
    
    //Singleton
    static let shared = EntryController()
    
    //SOURCE OF TRUTH
    var entries:[Entry] = []
    
    //Create
    func addEntryWith(title: String, text: String){
        let newEntry = Entry(Date(), text, text)
        entries.append(newEntry)
    }
    
    //Read
    
    
    //Update
    func update(entryToUpdate: Entry, titleUpdate: String, bodyUpdate: String){
        entryToUpdate.title = titleUpdate
        entryToUpdate.bodyText = bodyUpdate
    }
    
    //Delete
    func remove(entryToDelete: Entry){
        guard let index = entries.index(of: entryToDelete) else {return}
        entries.remove(at: index)
    }
    
    
}
