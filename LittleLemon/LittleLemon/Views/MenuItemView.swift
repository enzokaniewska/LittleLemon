//
//  MenuItemView.swift
//  LittleLemon
//
//  Created by Enzo Kaniewska on 12.07.23.
//

import SwiftUI

struct MenuItemView: View {
    
    @State var dish:Dish? = nil
        
    var body: some View {
        
        
        HStack(alignment: .center){
            
            VStack(alignment: .leading, spacing: 8){
                Text(dish?.title ?? "Dish title")
                    .font(.title3)
                
                Text(dish?.desc ?? "This is a great dish description")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("$\(dish?.price ?? "10")")
                    .font(.title3)
                    .padding(.trailing)
                    .bold()
            }
            .padding(.trailing)
            
            Spacer()
            
            
            
                AsyncImage(url: URL(string: dish?.image ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height:80)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }

        }
        
    }
}

struct MenuItemView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        MenuItemView()
    }
}
