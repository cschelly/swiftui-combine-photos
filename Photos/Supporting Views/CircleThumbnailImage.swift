//
//  CircleThumbnailImage.swift
//  Photos
//
//  Created by Christina S on 11/8/19.
//  Copyright © 2019 Christina. All rights reserved.
//

import SwiftUI

struct CircleThumbnailImage: View {
    var image: String
    init(_ image: String) {
        self.image = image
    }
    var body: some View {
        Image(image)
        .resizable()
        .frame(width: 65, height: 65)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 5)
    }
}

struct CircleThumbnailImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleThumbnailImage("apple")
            .previewLayout(.fixed(width: 75, height: 75))
            CircleThumbnailImage("berries")
            .previewLayout(.fixed(width: 75, height: 75))
            CircleThumbnailImage("bridge")
            .previewLayout(.fixed(width: 75, height: 75))
            CircleThumbnailImage("coffee")
            .previewLayout(.fixed(width: 75, height: 75))
            CircleThumbnailImage("eiffel")
            .previewLayout(.fixed(width: 75, height: 75))
        }
    }
}
