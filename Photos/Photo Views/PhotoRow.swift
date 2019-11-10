//
//  PhotoRow.swift
//  Photos
//
//  Created by Christina S on 11/8/19.
//  Copyright © 2019 Christina. All rights reserved.
//

import SwiftUI

struct PhotoRow: View {
    var photo: Photo
    init(_ photo: Photo) {
        self.photo = photo
    }
    var body: some View {
        HStack {
            CircleThumbnailImage(photo.image)
            VStack(alignment: .leading) {
                Text(photo.thumb.capitalized)
                    .font(.headline)
                Text(photo.title)
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
            PhotoRow(photoData[0])
            .previewLayout(.fixed(width: 320, height: 70))
            PhotoRow(photoData[1])
            .previewLayout(.fixed(width: 414, height: 70))
        }
    }
}
