//
//  GlobeView.swift
//  WanderLog
//
//  Created by Tarasha Bansal on 2/29/24.
//

import SwiftUI
import MapKit
import FirebaseFirestore


struct GlobeView: View {
    let db = Firestore.firestore()
    //Crete a MapCameraPosition variable to set the globe center and lens distance
    @State private var mapCamPos: MapCameraPosition = .camera(MapCamera(
        centerCoordinate: CLLocationCoordinate2D(latitude: 39, longitude: 34),
        distance: 30000000))
    //Location array to store merkers from the locations collection in the db
    @State private var locations = [Locations]()
    var body: some View {
        ZStack{
            Map(position: $mapCamPos){
                ForEach(locations){ location in
                    Marker(location.city,coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
            }
            .mapStyle(.hybrid(elevation: .realistic))
        }
        .onAppear(){
            getLocations()
        }
    }
    func getLocations(){
        self.locations = []
        var userID=""
        if let currentUser = UserManager.shared.currentUser {
            print("Showing profile for \(currentUser.username)")
            userID = currentUser.id
        }
        db.collection("locations")
        .getDocuments(){
            (querySnapshot,err) in
            if let err = err{ //error not nil
                print("Error getting documents: \(err)")
            }
            else{ //get locations from db
                for document in querySnapshot!.documents{
                    print("\(document.documentID)")
                    if let location = Locations(id:document.documentID, data: document.data()){
                        if location.userId == userID{
                            print("\(location)")
                            self.locations.append(location)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GlobeView()
}