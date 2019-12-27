//
//  ImageLoader.swift
//  ImageLoaderTest
//
//  Created by Christina Schell on 11/9/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI
import Combine

// Credit: https://osinski.dev/posts/swiftui-image-loading/ 🙏🏻
final class ImageLoader: ObservableObject {
    enum ImageLoadingError: Error {
        case incorrectData
    }

    @Published private(set) var image: UIImage? = nil
    
    private let imageUrl: String
    private var cancellable: AnyCancellable?
    
    init(_ imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        guard let url = URL(string: imageUrl) else { return }
        cancellable = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap { data, _ in
                guard let image = UIImage(data: data) else {
                    throw ImageLoadingError.incorrectData
                }
                
                return image
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] image in
                    self?.image = image
                }
            )
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
