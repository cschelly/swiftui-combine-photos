//
//  PhotoDetailView.swift
//  Photos
//
//  Created by Christina S on 11/9/19.
//  Copyright © 2019 Christina. All rights reserved.
//

import SwiftUI

struct PhotoDetailView: View {
    var photo: Photo
    init(_ photo: Photo) {
        self.photo = photo
    }
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectImage(photo.image)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(photo.thumb.capitalized)
                        .font(.title)
                        .padding(.trailing, 10)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                HStack {
                    Text(photo.title)
                    Spacer()
                }
            }.padding()
            Spacer()
        }.padding(.top, 15)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photoData[1])
    }
}
