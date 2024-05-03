//
//  User.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import Foundation

struct User : Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
