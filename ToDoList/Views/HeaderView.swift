//
//  HeaderView.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import SwiftUI

struct HeaderView: View {

    let title:String
    let subtitle:String
    let angle: Double
    let background: Color
    
    var body: some View {
        //Header
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white).bold()
                Text(subtitle)
                    .font(.system(size:20))
                .foregroundColor(Color.white)
            }
            .padding(.top,90)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y:-183)
       
    }
}

#Preview {
    HeaderView(title: "Title",
               subtitle: "Subtitle",
               angle:15, 
               background:.blue)
}
