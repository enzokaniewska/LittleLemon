//
//  Home.swift
//  LittleLemon
//
//  Created by Enzo Kaniewska on 10.07.23.
//

import SwiftUI
import CoreData

struct Home: View {
    let persistence = PersistenceController.shared
    var body: some View {
        TabView{
            Menu()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")
                }
                .environment(\.managedObjectContext, persistence.container.viewContext)
            
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
                
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
