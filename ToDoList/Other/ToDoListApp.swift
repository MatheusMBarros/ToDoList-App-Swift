//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

