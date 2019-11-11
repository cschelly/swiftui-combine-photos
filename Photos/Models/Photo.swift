//
//  Photo.swift
//  Photos
//
//  Created by Christina Schell on 11/9/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id: Int
    var thumb: String
    var image: String
    var title: String
}

struct Photo2: Codable, Identifiable {
    var id: String
    var author: String
    var url: String
    var downloadUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, url
        case downloadUrl = "download_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        author = try
            values.decode(String.self, forKey: .author)
        url = try values.decode(String.self, forKey: .url)
        downloadUrl = try values.decode(String.self, forKey: .downloadUrl)
    }
}
