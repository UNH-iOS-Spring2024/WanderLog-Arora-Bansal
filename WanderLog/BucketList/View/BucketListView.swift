//
//  BucketListView.swift
//  WanderLog
//
//  Created by Tarasha Bansal on 3/2/24.
//

import SwiftUI
import FirebaseFirestore

struct BucketListView: View {
    @State private var locations = [Locations]()
    @State private var progress = 0.0
    var body: some View {
        VStack{
            Text("Bucket List")
                .font(.largeTitle)
                .bold()
            Divider()
            List {
                ForEach(locations, id: \.self.id) { location in
                    CheckBoxView(location: location)
                }.onDelete { indexSet in
                    print(type(of: indexSet))
                    delete_bl_item(id:locations[indexSet.count].id)
                    
                    // TODO: delete items
                }
            }
            HStack{
                NavigationLink{
                    NewBucketItemView()
                }label:{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.green)
                    Text("Add Bucket List Item")
                        .foregroundStyle(.primary)
                }
                .foregroundStyle(.primary)
                Spacer()
            }
            Spacer()    
        }
        .padding()
        .onAppear(){
            getLocations()
        }
    }
    func delete_bl_item(id : String){
        let db = Firestore.firestore()
        db.collection("locations").document(id).delete()
    }
    func getLocations(){
        let db = Firestore.firestore()
        self.locations = []
        if let currentUser = UserManager.shared.currentUser{
            db.collection("locations").whereField("userID", isEqualTo: currentUser.id).getDocuments(){(querySnapshot,err) in
            if let err = err{ //error not nil
                print("Error getting documents: \(err)")
            }
            else{ //get locations from db
                for document in querySnapshot!.documents{
                    if let location = Locations(id:document.documentID, data: document.data()){
                        self.locations.append(location)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BucketListView()
}
