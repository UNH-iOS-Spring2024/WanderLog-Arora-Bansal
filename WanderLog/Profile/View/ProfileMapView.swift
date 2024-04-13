//
//  ProfileMapView.swift
//  WanderLog
//
//  Created by Tarasha Bansal on 2/29/24.
//

import SwiftUI
import FirebaseFirestore

func getUser() -> User {
    var user = User(id: "", data: ["fullname" : "",
                                                 "username" : "",
                                                 "password" : 0,
                                                 "bio" : "",
                                                 "email" : ""])!
    let db = Firestore.firestore()
    if let currentUser = UserManager.shared.currentUser{
        db.collection("users").document(currentUser.id).getDocument { snapshot, err in
            if let u = User(id: snapshot?.documentID ?? "", data: snapshot?.data() ?? ["username":""]){
                print("from mapview\n \(u.username)")
                user = u
            }
        }
    }
    return user
}
struct ProfileMapView: View {
    @State var user : User = getUser()
    @State private var selfProfile = false
    @State private var showPhotos = false
    var body: some View {
        VStack{
            VStack{
                ProfileView(user: user, selfProfile: selfProfile)
                Divider()
            }                
            .padding()
            GlobeView(user: user)
            
            Spacer()
        }
        .onAppear(){
            print(user.id)
            checkUser()
        }
        
    }
    func checkUser(){
        let db = Firestore.firestore()
        if let currentUser = UserManager.shared.currentUser{
            db.collection("users").document(currentUser.id).getDocument { snapshot, err in
                if let u = User(id: snapshot?.documentID ?? "", data: snapshot?.data() ?? ["username":""]){
                    self.user = u
                    
                    selfProfile = true
                }
            }
        }
    }
}

#Preview {
    ProfileMapView()
}
