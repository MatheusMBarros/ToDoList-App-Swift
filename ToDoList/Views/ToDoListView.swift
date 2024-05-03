import FirebaseFirestoreSwift
import SwiftUI
import FirebaseAuth

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    let userId: String // Adicionando userId como uma propriedade
    
    init(userId: String){
        self.userId = userId // Atribuindo o userId fornecido à propriedade
        
        // Construindo o caminho da coleção Firestore com base no userId fornecido
        let collectionPath = "users/rxlNE2qPZVbq2yLACDB9j9wcpup1/todos"
        
        // Inicializando FirestoreQuery com o caminho correto
        self._items = FirestoreQuery(collectionPath: collectionPath)
        
        // Inicializando o viewModel com base no userId fornecido
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }

    var body: some View {
        NavigationView {
            VStack {
                List(items){ item in
                    ToDoListItemView(item: item).swipeActions(){
                        Button("Delete"){
                            viewModel.deleteItem(userId: userId, id: item.id)
                        }.tint(.red)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("To Do List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.showingNewItemView = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
}

#Preview{
    ToDoListView(userId: "rxlNE2qPZVbq2yLACDB9j9wcpup1")
}
