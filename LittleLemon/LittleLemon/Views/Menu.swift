//
//  Menu.swift
//  LittleLemon
//
//  Created by Enzo Kaniewska on 10.07.23.
//

import SwiftUI

struct Menu: View {
    
    @State var selectedCategory = ""
    @State var menuList = MenuList(menu: [])
    @State var searchText = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            HeroView(searchText: $searchText)
            
            HStack{
                Text("ORDER FOR DELIVERY:")
                    .padding(.horizontal)
                    .font(.headline)
                
                Image("Delivery van")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
            }
            .padding(.top, 5)
    
            CategoryRow(selectedCategory: $selectedCategory)
                .padding(.bottom)
            
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors())
            { (dishes: [Dish]) in
                List{
                    ForEach(dishes){ dish in
                        MenuItemView(dish: dish)
                            
                    }
                }
                .listStyle(.inset)
     
                
            }
                
        }
        .onAppear{
            getMenuData()
        }
        
    }
    
    func getMenuData(){
        PersistenceController.shared.clear()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, resonse, error in
            if let data = data, error == nil{
                let menuList = try? JSONDecoder().decode(MenuList.self, from: data)
                guard let menuList = menuList else { return }
                
                for item in menuList.menu{
                   
                    let dish = Dish(context: viewContext)
                    dish.title = item.title
                    dish.desc = item.description
                    dish.price = item.price
                    dish.image = item.image
                    
                    try? viewContext.save()
                }
            }
        
        }
        task.resume()
        
        
    }
    
    func buildSortDescriptors()-> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate()->NSPredicate{
        if searchText.isEmpty{
            return NSPredicate(value: true)
        }else{
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

struct HeroView: View {
    
    @Binding var searchText:String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Little Lemon")
                .font(Font.custom("MarkaziText-Regular", size: 64))
                .foregroundColor(Color("Primary2"))
            
            HStack(alignment: .top){
                
                VStack(alignment: .leading, spacing: 5){
                    
                    
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.white)
                    
                }
                
                Image("Hero image")
                    .resizable()
                    .frame(width: 120, height:140)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
          
            
            
            TextField("Search", text: $searchText)
                .padding(.vertical, 7)
                .padding(.horizontal, 5)
                .background(.white)
                .cornerRadius(8)
                .padding(.vertical, 8)
                .padding(.horizontal, 5)
            
        }
        .padding(10)
        .padding(.bottom, 5)
        .background(Color("Primary1"))
    }
}
