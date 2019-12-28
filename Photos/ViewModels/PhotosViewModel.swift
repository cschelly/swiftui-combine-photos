//
//  PhotosViewModel.swift
//  Photos
//
//  Created by Christina Schell on 12/27/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI
import Combine

final class PhotosViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var photos: Photos = []

    var searchTerm: String = ""

    private let searchTappedSubject = PassthroughSubject<Void, Error>()
    private var disposeBag = Set<AnyCancellable>()

    init() {
        searchTappedSubject
        .flatMap {
            self.load(search: self.searchTerm)
                .handleEvents(receiveSubscription: { _ in
                    DispatchQueue.main.async {
                        self.isLoading = true
                    }
                },
                receiveCompletion: { comp in
                    if let error = comp as? Error {
                        print("Request failed: \(String(describing: error))")
                    }
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                })
                .eraseToAnyPublisher()
        }
        .replaceError(with: photosDefault.hits)
        .receive(on: DispatchQueue.main)
        .assign(to: \.photos, on: self)
        .store(in: &disposeBag)
    }

    func onSearchTapped() {
        searchTappedSubject.send(())
    }

    private func load(search term: String) -> AnyPublisher<Photos, Error> {
        guard let url = URL(string: "https://pixabay.com/api/?key=\(Keys.pixabayAPIKey)&q=\(term)&image_type=photo") else {
            return Fail(error: URLError(.badURL))
                .mapError { $0 as Error }
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
               .map { $0.data }
               .mapError { $0 as Error }
               .decode(type: PhotoData.self, decoder: JSONDecoder())
               .map { $0.hits }
               .eraseToAnyPublisher()
    }

}
