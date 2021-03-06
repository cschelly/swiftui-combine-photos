//
//  String+titleFromURL.swift
//  Photos
//
//  Created by Christina Schell on 12/27/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import Foundation

extension String {
    var title: String {
        self.components(separatedBy: "https://pixabay.com/photos/")[1].split(separator: "-").dropLast().joined(separator: " ")
        .replacingOccurrences(of: "%", with: "")
        .replacingOccurrences(of: "&", with: "")
        .replacingOccurrences(of: "?", with: "")
        .replacingOccurrences(of: "_", with: "")
        .lowercased()
        .capitalized
    }
}
