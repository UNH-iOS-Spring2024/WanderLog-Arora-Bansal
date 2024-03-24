//
//  LoginView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/20/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            Spacer()
            LogoView()
            TextField("Email", text: $viewModel.email)
                .padding(10)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(WLTextFieldModifier())
            
            SecureField("Password", text: $viewModel.password)
                .padding(10)
                .modifier(WLTextFieldModifier())
            
            
            Button {
                print("show forget password")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 28)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button {
            Task { try await viewModel.signIn() }
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
              
            NavigationLink{
                SignUpview()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing:3){
                    Text("Dont have an account? ")
                    Text("Sign Up")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .font(.footnote)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding(0)
            }

        }
        .padding()
     
    }
}

struct LoginView_Previews1: PreviewProvider{
    static var previews: some View{
            LoginView()
        }
    }
