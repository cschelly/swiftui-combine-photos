//
//  Photos.swift
//  Photos
//
//  Created by Christina Schell on 11/9/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

// MARK: - Photos
struct PhotoData: Codable {
    let totalHits: Int
    let hits: Photos
    let total: Int
}

// MARK: - Hit
struct Photo: Codable, Identifiable {
    let largeImageURL: String
    let webformatHeight, webformatWidth, likes, imageWidth: Int
    let id, userID, views, comments: Int
    let pageURL: String
    let imageHeight: Int
    let webformatURL: String
    let type: TypeEnum
    let previewHeight: Int
    let tags: String
    let downloads: Int
    let user: String
    let favorites, imageSize, previewWidth: Int
    let userImageURL, previewURL: String

    enum CodingKeys: String, CodingKey {
        case largeImageURL, webformatHeight, webformatWidth, likes, imageWidth, id
        case userID = "user_id"
        case views, comments, pageURL, imageHeight, webformatURL, type, previewHeight, tags, downloads, user, favorites, imageSize, previewWidth, userImageURL, previewURL
    }
}

enum TypeEnum: String, Codable {
    case photo = "photo"
}
