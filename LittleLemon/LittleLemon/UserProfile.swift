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
        
        VStack(spacing: 20){
            
            Text("Personal information")
                .font(.headline)
        
            Image("profile-image-placeholder")
            
            Text(firstName ?? "N/A")
            
            Text(lastName ?? "N/A")
            
            Text(email ?? "N/A")
            
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: UDKeys.isLoggedInKey)
                presentation.wrappedValue.dismiss()
            }
            
            Spacer()
            
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
