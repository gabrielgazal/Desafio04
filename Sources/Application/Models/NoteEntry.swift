//
//  NoteEntry.swift
//  Application
//
//  Created by Gabriel Rodrigues Gazal Rocha on 23/04/20.
//

import Foundation


struct NoteEntry:Codable {
    
    var id: String?
    var text: String
    var label: String
    var data: Date
}
