//
//  ImageLoadingView.swift
//  ImageLoaderTest
//
//  Created by Christina Schell on 11/10/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI
import Combine

// Credit: https://osinski.dev/posts/swiftui-image-loading/ 🙏🏻
struct ImageLoadingView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
            }
        }
        .onAppear(perform: imageLoader.load)
        .onDisappear(perform: imageLoader.cancel)
    }
}
