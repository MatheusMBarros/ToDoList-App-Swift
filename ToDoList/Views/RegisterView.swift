//
//  RegisterView.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        HeaderView(title: "Register",
                   subtitle: "Start organizing todos",
                   angle: -15.0,
                   background: .purple)


        Form{
            TextField("Full Name" , text:$viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email Address" , text:$viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password" , text:$viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()

            TLButton(title: "Create Account", 
                     background: .green
            ){
                viewModel.register()
            }
        }
        .offset(y:-50)
        





        Spacer()

    }
}


#Preview {
    RegisterView()
}
