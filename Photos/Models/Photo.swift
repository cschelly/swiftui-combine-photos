//
//  Photo.swift
//  Photos
//
//  Created by Christina S on 11/9/19.
//  Copyright © 2019 Christina. All rights reserved.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id: Int
    var thumb: String
    var image: String
    var title: String
}
