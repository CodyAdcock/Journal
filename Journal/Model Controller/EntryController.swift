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
        let newEntry = Entry(Date(), title, text)
        entries.append(newEntry)
        saveToPersistentStore()
    }
    
    //Read
    
    
    //Update
    func update(entryToUpdate: Entry, titleUpdate: String, bodyUpdate: String){
        entryToUpdate.title = titleUpdate
        entryToUpdate.bodyText = bodyUpdate
        saveToPersistentStore()
    }
    
    //Delete
    func remove(entryToDelete: Entry){
        guard let index = entries.index(of: entryToDelete) else {return}
        entries.remove(at: index)
        saveToPersistentStore()
    }
    
    //MARK: - Persistence
    
    //create a file URL
    func fileURL() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "entries.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        return fullURL
    }
    
    //Use that file URL to encode and save the data
    func saveToPersistentStore(){
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(entries)
            print(data)
            try data.write(to: fileURL())
        }catch{
            print("There was an error Saving to Persistent Store \(error) \(error.localizedDescription) 💩")
        }
        
    }
    
    //Use that file url to load and decode the data
    func loadFromPersistentStore() -> [Entry]{
        do{
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let entries = try decoder.decode([Entry].self, from: data)
            return entries
        } catch {
            print("There was an error Loading from Persistent Store \(error) \(error.localizedDescription) 💩")
        }
        return[]
    }
    
    
    
}
