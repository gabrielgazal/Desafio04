
//
//  ReflectionEntry.swift
//  Application
//
//  Created by Gabriel Rodrigues Gazal Rocha on 23/04/20.
//

import Foundation
import KituraContracts
import SwiftKueryORM

struct ReflectionParams: QueryParams {
    var creationDate: Date
    
    
}

struct Reflection: Model {
    internal init(id: String?, text: String, creationTime: Date) {
        self.id = id
        self.text = text
        self.creationTime = creationTime
    }
    
    var id: String?
    var text: String
    var creationTime: Date
}
