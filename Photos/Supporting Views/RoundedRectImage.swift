//
//  RoundedRectImage.swift
//  Photos
//
//  Created by Christina S on 11/9/19.
//  Copyright © 2019 Christina. All rights reserved.
//

import SwiftUI

struct RoundedRectImage: View {
    var image: String
    init(_ image: String) {
        self.image = image
    }
    var body: some View {
        Image(image)
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

struct RoundedRectImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectImage(photoData[5].image)
    }
}
