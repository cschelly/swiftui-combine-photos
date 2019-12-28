//
//  SearchBar.swift
//  Photos
//
//  Created by Christina S on 12/27/19.
//  Copyright © 2019 Christina. All rights reserved.
//

import SwiftUI

struct SearchBar: View {

    @EnvironmentObject var viewModel: PhotosViewModel
    @Binding var searchString: String

    var body: some View {

        HStack {
            TextField("Search for photos...",
                      text: $searchString,
                      onCommit: { self.search() })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: { self.search() }) {
                Image(systemName: "magnifyingglass")
            }
        }   .padding()
    }

    func search() {
        viewModel.searchTerm = searchString
        viewModel.onSearchTapped()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchString: .constant("shirts")).environmentObject(PhotosViewModel())
    }
}
