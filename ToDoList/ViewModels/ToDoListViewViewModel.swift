//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//
import FirebaseFirestore
import Foundation

/// ViewModel for list of itens view
///  Primary tab
class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId : String ){
        self.userId = userId
    }
    

    
    func deleteItem(userId: String, id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete { error in
                if let error = error {
                    print("Error removing document: \(error)")
                } else {
                    print("Document successfully removed!")
                }
            }
    }

    
}
