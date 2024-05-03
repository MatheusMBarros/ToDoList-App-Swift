import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn {
                accounteView
              
            } else {
                LoginView()
            }
        }
    }
    @ViewBuilder
    var accounteView : some View {
        TabView{
            ToDoListView(userId:viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage:"house")
                }
            ProfileView()
                .tabItem {
                    Label("profile", systemImage:"person.circle")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
