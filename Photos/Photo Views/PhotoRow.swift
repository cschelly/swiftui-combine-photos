//
//  PhotoRow.swift
//  Photos
//
//  Created by Christina Schell on 11/8/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct PhotoRow: View {
    var photo: Photo
    init(_ photo: Photo) {
        self.photo = photo
    }
    var body: some View {
        HStack {
            ThumbnailImageLoadingView(photo.previewURL)
            VStack(alignment: .leading) {
                Text(photo.pageURL.title)
                    .font(.headline)
                Text(photo.user)
                    .font(.body)
            }
            .padding(.leading, 5)
        }
        .padding(20)
    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoRow(photosDefault.hits[0])
            .previewLayout(.fixed(width: 320, height: 70))
            PhotoRow(photosDefault.hits[1])
            .previewLayout(.fixed(width: 414, height: 70))
        }
    }
}
