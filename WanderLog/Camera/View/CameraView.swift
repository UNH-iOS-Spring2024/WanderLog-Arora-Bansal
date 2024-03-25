//
//  CameraView.swift
//  WanderLog
//
//  Created by Tarasha Bansal on 3/2/24.
//
//Got this code from Apple Tutorials from https://developer.apple.com/tutorials/sample-apps/capturingphotos-camerapreview
import SwiftUI

struct CameraView: View {
    @StateObject private var model = DataModel()
    @State private var closed = false
    private static let barHeightFactor = 0.15
    
    
    var body: some View {
       
            ZStack{
                NavigationStack {
                GeometryReader { geometry in
                    ViewfinderView(image:  $model.viewfinderImage )
                        .overlay(alignment: .top) {
                            Color.black
                                .opacity(0.75)
                                .frame(height: geometry.size.height * Self.barHeightFactor)
                            closeButtonView()
                        }
                        .overlay(alignment: .bottom) {
                            buttonsView()
                                .frame(height: geometry.size.height * Self.barHeightFactor)
                                .background(.black.opacity(0.75))
                        }
                        .overlay(alignment: .center)  {
                            Color.clear
                                .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                                .accessibilityElement()
                                .accessibilityLabel("View Finder")
                                .accessibilityAddTraits([.isImage])
                        }
                        .background(.black)
                }
                .task {
                    await model.camera.start()
                    await model.loadPhotos()
                    await model.loadThumbnail()
                }
                .navigationTitle("Camera")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .ignoresSafeArea()
                .statusBar(hidden: true)
            }
        }
    }
    
    private func buttonsView() -> some View {
        HStack(spacing: 60) {
            
            Spacer()
            
            NavigationLink {
                PhotoCollectionView(photoCollection: model.photoCollection)
                    .onAppear {
                        model.camera.isPreviewPaused = true
                    }
                    .onDisappear {
                        model.camera.isPreviewPaused = false
                    }
            } label: {
                Label {
                    Text("Gallery")
                } icon: {
                    ThumbnailView(image: model.thumbnailImage)
                }
            }
            
            Button {
                model.camera.takePhoto()
            } label: {
                Label {
                    Text("Take Photo")
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
            Button {
                print("turn")
                model.camera.switchCaptureDevice()
            } label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Spacer()
        
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
    private func closeButtonView() -> some View {
        HStack() {
            Spacer()
            Button {
                print("close")
//                closed = true
            } label: {
                NavigationLink(destination: NavBarUI(tabViewSelection: 0)){
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                }
                
            }
        }
        .buttonStyle(.plain)
        .padding(30)
    }
    
}

#Preview {
    CameraView()
}