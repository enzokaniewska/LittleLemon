//
//  CategoryRow.swift
//  LittleLemon
//
//  Created by Enzo Kaniewska on 12.07.23.
//

import SwiftUI

struct CategoryRow: View {
    
    @Binding var selectedCategory:String
    let categories = ["starters", "mains", "desserts", "sides"]
    var body: some View {
        
        HStack(){
            Spacer()
            ForEach(categories, id: \.self){ category in
                
                Text(category)
                    .frame(width: 80, height: 30)
                    .background(Color(uiColor: .secondarySystemFill))
                    .foregroundColor(.secondary)
                    .bold()
                    .cornerRadius(8)
                    .onTapGesture {
                        if selectedCategory == category{
                            selectedCategory = ""
                        }else{
                            selectedCategory = category
                        }
                    }
                Spacer()
            }
            
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(selectedCategory: .constant(""))
    }
}
