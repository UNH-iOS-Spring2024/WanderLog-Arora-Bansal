//
//  LoginView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 2/26/24.
//

import SwiftUI
import FirebaseFirestore


struct LoginView: View {
    let db = Firestore.firestore()
    @State var users = [User]()
   
    @State private var username = ""
    @State private var password = ""
    @State private var loginSuccess = false
    @State private var incorrectPassword = false
    @State private var showSignUp = false

    
    var body: some View {
        NavigationStack {
            VStack {
                FullLogoView()
                VStack{
                    VStack {
                        TextField("Username", text: $username)
                            .padding(10)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            
                        SecureField("Password", text: $password)
                            .padding(10)

                    }.padding(20)
                    if incorrectPassword{
                        Text("Incorrect Password! Please Try again!")
                            .foregroundStyle(.red)
                    }
                        
                        
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
                    
                    NavigationLink(destination: NavBarUI(tabViewSelection: 0), isActive: $loginSuccess){}
                    Button( action:{
                        login()
                        
                    } ,label:{
                        Text("Login")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    })
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    HStack(spacing:3){
                        Text("Don't have an account yet?")
                        NavigationLink {
                            SignUpView()
                        } label: {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                    }
                    .font(.system(size:14))
                }
            }
            .onAppear(){
                getUser()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func login() {
        let data = [username,password]
        //if textfields are empty login should fail
        if (data[0]=="" || data[1]==""){
            print("Login failed!")
            username = ""
            password = ""
        }
        else{
            for i in users{
                //find entered username
                if(i.username == data[0]){
                    //if found, check password
                    if(i.password == data[1]){
                        //if correct, login success
                        print("Login Success")
                        loginSuccess = true
                        //update currentUser
                        UserManager.shared.updateUser(id: i.id, username: i.username, email: i.email,  bio: i.bio, fullname: i.fullname)
                    }
                    else{
                        //Incorrect password error
                        incorrectPassword = true
                        print("Incorrect Password")
                    }
                    //break out of loop once user is found
                    break
                }
                //if user not found, clear fields.
                else{
                    print("User not found!")
                    username = ""
                    password = ""
                }
            }
        }
    }
    func getUser(){
        self.users = []
        db.collection("users")
        .getDocuments(){
            (querySnapshot,err) in
            if let err = err{ //error not nil
                print("Error getting documents: \(err)")
            }
            else{ //get users from db
                for document in querySnapshot!.documents{
                    if let user = User(id:document.documentID, data: document.data()){
                        self.users.append(user)
                    }
                }
            }
        }
    }
}

#Preview  {
    LoginView()
}
