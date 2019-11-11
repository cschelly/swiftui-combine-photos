//
//  PhotoDetailView.swift
//  Photos
//
//  Created by Christina Schell on 11/9/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct PhotoDetailView: View {
    var photo: Photo2
    init(_ photo: Photo2) {
        self.photo = photo
    }
    var body: some View {
        VStack(spacing: 40) {
            DetailImageLoadingView(photo.downloadUrl)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(photo.author)
                        .font(.title)
                        .padding(.trailing, 10)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                HStack {
                    Text(photo.url)
                    Spacer()
                }
            }.padding()
            Spacer()
        }.padding(.top, 15)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photoData2[1])
    }
}
