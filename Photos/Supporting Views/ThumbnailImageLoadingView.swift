//
//  ThumbnailImageLoadingView.swift
//  ImageLoaderTest
//
//  Created by Christina S on 11/10/19.
//  Copyright © 2019 Tealium. All rights reserved.
//

import SwiftUI
import Combine

struct ThumbnailImageLoadingView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(_ imageUrl: String) {
        imageLoader = ImageLoader(imageUrl)
    }
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)
            }
        }
        .onAppear(perform: imageLoader.load)
        .onDisappear(perform: imageLoader.cancel)
    }
}

struct ThumbnailImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailImageLoadingView(photosDefault.hits[0].previewURL)
    }
}
