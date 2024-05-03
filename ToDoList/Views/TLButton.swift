//
//  TLButton.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background:Color
    let action: () -> Void
    
    
    
    var body: some View {
        Button{
            //Action
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundStyle(Color.white)
                    .font(.system(size:20))
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title:"Value", background: .cyan){
        //Action
    }
}
