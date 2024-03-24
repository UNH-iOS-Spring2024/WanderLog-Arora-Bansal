//
//  CreateInitialBucketList.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import SwiftUI

struct CreateInitialBucketList: View {
//    @State var buckets: [Bucket] = [Bucket(id: UUID().uuidString, city: "", country: "", visited: false)]
    @State var country: String
    @State var city: String
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            LogoView()
            Text("Create Bucket List")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top)
            
            Text("Create a bucket list to begin")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
//            ForEach(buckets.indices, id: \.self) { index in
//                BucketListView(bucket: $buckets[0])
//            }
            
            TextField("Country", text: $country)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(WLTextFieldModifier())
                .padding(.top)
            
            TextField("City", text: $city)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(WLTextFieldModifier())
                .padding(.top)
            
            Button {
                addBucket()
            } label: {
                Text("Add Bucket")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            NavigationLink {
                HomeView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Continue")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
    
    func addBucket() {
//        buckets.append(Bucket(id: UUID().uuidString, city: "", country: "", visited: false))
    }
}

#Preview {
    CreateInitialBucketList(country: "India", city: "Delhi")
}

