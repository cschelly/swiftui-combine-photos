//
//  PhotoDetailView.swift
//  Photos
//
//  Created by Christina Schell on 11/9/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct PhotoDetailView: View {
    var photo: Photo
    init(_ photo: Photo) {
        self.photo = photo
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            DetailImageLoadingView(photo.largeImageURL)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    IconView(iconName: "heart.fill", statistic: photo.favorites, color: .red)
                    IconView(iconName: "bubble.left.fill", statistic: photo.comments)
                }
                HStack {
                    Text(photo.pageURL.title)
                        .font(.headline)
                        .padding(.trailing, 10)
                }
                Text(photo.user)
            }.padding()
            Spacer()
        }.padding(.top, 15)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photosDefault.hits[0])
    }
}


