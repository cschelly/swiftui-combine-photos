//
//  DetailImageLoadingView.swift
//  Photos
//
//  Created by Christina Schell on 11/10/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI
import Combine

struct DetailImageLoadingView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(_ imageUrl: String) {
        imageLoader = ImageLoader(imageUrl)
    }
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                .resizable()
                .frame(width: 385, height: 285)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
                .shadow(radius: 7)
            }
        }
        .onAppear(perform: imageLoader.load)
        .onDisappear(perform: imageLoader.cancel)
    }
}

struct DetailImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageLoadingView(photosDefault.hits[0].largeImageURL)
    }
}
