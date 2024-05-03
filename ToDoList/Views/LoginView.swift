//
//  LoginView.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
              HeaderView(title: "To Do List", 
                         subtitle: "Get things done",
                         angle: 15.0, 
                         background: .pink)
            
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundStyle(Color.red)
                    }

                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                    SecureField("Password ", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TLButton(title: "Log In", background: .blue){
                        viewModel.login()                    }
                }
                .offset(y:-90)
                
                
                
                
                //Create Account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create an Account", destination: RegisterView())

                }
                
            }
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
