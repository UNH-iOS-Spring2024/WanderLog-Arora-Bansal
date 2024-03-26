//
//  ProfileGridView.swift
//  WanderLog
//
//  Created by Tarasha Bansal on 2/29/24.
//

import SwiftUI

struct ProfileGridView: View {
    @State private var showMap = false
    //Hardcoding pictures list for now. Will make it dynamic after posting feature is implemented
    var images: [String] = ["1","2","3","4","5","6","7"]
    var columngrid:[GridItem] = [GridItem(.flexible(),spacing:5),GridItem(.flexible(),spacing:5),GridItem(.flexible(),spacing:5)]
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    
                    Button{
                        print("Back button pressed")
                        showMap = true
                    }label:{
                        
                        HStack{
                            Image(systemName: "chevron.backward")
                            Text("Back")
                            Spacer()
                        }
                        .foregroundStyle(.black)
                    }
                }
            }
            .padding()
            ScrollView{
                LazyVGrid(columns: columngrid, spacing: 5){
                    ForEach(images, id:\.self){ image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                    }
                    
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showMap) {
                         NavBarUI(tabViewSelection: 4)
                     }
        
        
    }
}

#Preview {
    ProfileGridView()
}