//
//  Menu.swift
//  LittleLemon
//
//  Created by Enzo Kaniewska on 10.07.23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
         
            VStack(alignment: .leading, spacing: 10){
                Text("Little Lemon")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("Primary2"))
                Text("Chicago")
                    .foregroundColor(.white)
                    .font(.title2)
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .foregroundColor(.white)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(10)
            .background(Color("Primary1"))
            
            
            
            List{
                
                Text("Item 1")
                
                Text("Item 2")
            }
            .listStyle(.inset)
            
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
