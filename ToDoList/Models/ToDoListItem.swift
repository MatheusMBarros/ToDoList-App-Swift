//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
