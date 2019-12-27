//
//  PhotoListView.swift
//  Photos
//
//  Created by Christina Schell on 11/9/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct PhotoListView: View {
    var body: some View {
        NavigationView {
            List(photoData2) { photo in
                NavigationLink(destination: PhotoDetailView(photo)) {
                    PhotoRow(photo)
                }
            }.navigationBarTitle("Photos")
        }
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView()
    }
}
