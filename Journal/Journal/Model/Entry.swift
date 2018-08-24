//
//  Entry.swift
//  Journal
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class Entry: Equatable, Codable{
    
    static func == (lhs: Entry, rhs: Entry) -> Bool{
        if lhs.timeStamp != rhs.timeStamp {return false}
        if lhs.title != rhs.title {return false}
        if lhs.bodyText != rhs.bodyText {return false}
        return true
    }
    
    var timeStamp: Date
    var title: String
    var bodyText: String
    
    init(_ timeStamp: Date = Date(), _ title: String, _ bodyText: String){
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
}
