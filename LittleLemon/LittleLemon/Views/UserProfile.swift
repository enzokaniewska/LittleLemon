//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Enzo Kaniewska on 10.07.23.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: UDKeys.firstNameKey)
    let lastName = UserDefaults.standard.string(forKey: UDKeys.lastNameKey)
    let email = UserDefaults.standard.string(forKey: UDKeys.emailKey)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            Text("Personal information")
                .font(.title2)
        
            HStack {
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                Spacer()
            }
            
            Group{
                Text("first name")
             
                Text(firstName ?? "N/A")
                    .font(.title3)
                    
                Divider()
                
                Text("last name")
           
                Text(lastName ?? "N/A")
                    .font(.title3)
          
                Divider()
            
                Text("email")
                        
                Text(email ?? "N/A")
                    .font(.title3)
            }
            .font(.subheadline)
           
            
            HStack {
                Spacer()
                Button("Logout"){
                    UserDefaults.standard.set(false, forKey: UDKeys.isLoggedInKey)
                    presentation.wrappedValue.dismiss()
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .padding(.top, 30)
                
                Spacer()
            }
            Spacer()
            
        }
        .padding(.horizontal)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
