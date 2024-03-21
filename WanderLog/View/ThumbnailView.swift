//
//  ThumbnailView.swift
//  WanderLog
//
//  Created by Tarasha Bansal on 3/21/24.
//
//Got this code from Apple Tutorials from https://developer.apple.com/tutorials/sample-apps/capturingphotos-camerapreview
import SwiftUI

struct ThumbnailView: View {
    var image: Image?
    
    var body: some View {
        ZStack {
            Color.white
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 41, height: 41)
        .cornerRadius(11)
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static let previewImage = Image(systemName: "photo.fill")
    static var previews: some View {
        ThumbnailView(image: previewImage)
    }
}
