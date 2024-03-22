//
//  LoginView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/20/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Spacer()
            LogoView()
            TextField("Username", text: $username)
                .padding(10)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding(10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                print("show forget password")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
//                    .padding(.top)
                    .padding(.trailing, 28)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button {
                print("login")
            } label: {
                Text("Log In")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            .cornerRadius(5)
            .disabled(username.isEmpty || password.isEmpty)
            
            
            VStack {
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(0)
                            
                            Text("OR")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 10)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(0)
                
                }
            }
            
            Button {
                // Handle sign in with Apple
            } label: {
                Image(systemName: "applelogo")
                Text("Continue with Apple")
            }
            .padding()
            .foregroundColor(.black)
            
            Spacer()
                    

        }
        .padding()
        
     
        
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
