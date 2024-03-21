//
//  SignUpview1.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/21/24.
//

import SwiftUI

struct SignUpview1: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
        VStack{
            LogoView()
            
            TextField("Email ID", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            TextField("Full Name", text: $fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            Button {
                print("continue button pressed")
            } label: {
                Text("Continue")
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemGray))
            .cornerRadius(10)
            
            HStack {
                    Text("Already have an account?")
                    Button {
                                // Handle navigation to sign in
                    } label: {
                        Text("Sign In")
                    }
                }
            
        }
    }
}

#Preview {
    SignUpview1()
}
