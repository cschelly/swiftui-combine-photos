//
//  Test.swift
//  Photos
//
//  Created by Christina S on 11/10/19.
//  Copyright © 2019 Christina. All rights reserved.
//

import SwiftUI
import Combine

final class Loader: ObservableObject {
    
    var task: URLSessionDataTask!
    @Published var data: Data? = nil
    
    init(_ url: URL) {
        task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        })
        task.resume()
    }
    deinit {
        task.cancel()
    }
}

let placeholder = UIImage(named: "placeholder.jpg")!

struct AsyncImage: View {
    init(url: URL) {
        self.imageLoader = Loader(url)
    }
    
    @ObservedObject private var imageLoader: Loader
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }
    
    
    var body: some View {
        Image(uiImage: image ?? placeholder)
    }
}
