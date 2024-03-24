//
//  SignUpview1.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/21/24.
//

import SwiftUI

struct SignUpview: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    
    var body: some View {
        
        VStack{
            LogoView()
            
            TextField("Email ID", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .autocapitalization(.none)
            
            TextField("Full Name", text: $viewModel.fullname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .disableAutocorrection(true)
            
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            Button {
               
               Task { try await viewModel.createUser() }
                print("Login view was passed.")
            } label: {
                Text("Continue")
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemGray))
            .cornerRadius(10)
            
            NavigationLink{
                LoginView()
            } label: {
                HStack(spacing:3){
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                .font(.system(size:14))
                .foregroundColor(.blue)
            }
        }
    }
}
    
struct SignUpview_Previews1: PreviewProvider{
    static var previews: some View{
            SignUpview()
        }
    }

