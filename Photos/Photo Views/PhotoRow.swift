//
//  PhotoRow.swift
//  Photos
//
//  Created by Christina Schell on 11/8/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct PhotoRow: View {
    var photo: Photo2
    init(_ photo: Photo2) {
        self.photo = photo
    }
    var body: some View {
        HStack {
            ThumbnailImageLoadingView(photo.downloadUrl)
            VStack(alignment: .leading) {
                Text(photo.author)
                    .font(.headline)
                Text(photo.url)
                    .font(.body)
            }
            .padding(.leading, 5)
        }
        .padding(5)
    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoRow(photoData2[0])
            .previewLayout(.fixed(width: 320, height: 70))
            PhotoRow(photoData2[1])
            .previewLayout(.fixed(width: 414, height: 70))
        }
    }
}
