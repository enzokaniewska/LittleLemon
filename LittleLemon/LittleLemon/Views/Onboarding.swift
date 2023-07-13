//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Enzo Kaniewska on 10.07.23.
//

import SwiftUI

struct Onboarding: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    @State var isLoggedIn = false
    
   
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20){
                
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Text("Welcome to little lemon!")
                    .font(.title2)
                    .bold()
                    
                Image("Logo")
                    .padding(.bottom)
                Group{
                    TextField("First Name", text: $firstName)
                        .overlay(alignment: .bottom){
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("Primary1").opacity(0.5))
                        }
                    
                    TextField("Last Name", text: $lastName)
                        .overlay(alignment: .bottom){
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("Primary1").opacity(0.5))
                        }
                    
                    
                    TextField("Email", text: $email)
                        .overlay(alignment: .bottom){
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("Primary1").opacity(0.5))
                            
                        }
                    
                }
                
                
                Button {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        return
                    }else{
                        UserDefaults.standard.set(firstName, forKey: UDKeys.firstNameKey)
                        UserDefaults.standard.set(lastName, forKey: UDKeys.lastNameKey)
                        UserDefaults.standard.set(email, forKey: UDKeys.emailKey)
                        UserDefaults.standard.set(true, forKey: UDKeys.isLoggedInKey)
                        isLoggedIn = true
                    }
                } label: {
                    Label("Register", systemImage: "")
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .labelStyle(.titleOnly)
                        .background(Color("Primary1"))
                        .tint(.white)
                        .font(.title2)
                        .cornerRadius(20)
                }
                

                
            }
            .padding(.horizontal)
            .onAppear{
                if UserDefaults.standard.bool(forKey: UDKeys.isLoggedInKey){
                    isLoggedIn = true
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Register")
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

public class UDKeys{
    static var firstNameKey = "firstName"
    static var lastNameKey = "lastName"
    static var emailKey = "email"
    static var isLoggedInKey = "loggedIn"
}
