//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
/// ViewModel for singles to do list item view (each row in items list)
///  Primary tab
///   init(){}
class ToDoListItemViewViewModel: ObservableObject{
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
