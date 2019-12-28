//
//  IconView.swift
//  Photos
//
//  Created by Christina Schell on 12/27/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct IconView: View {
    var iconName: String
    var statistic: Int
    var color: Color? = .black
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(color)
                .padding(10)
            Text(String(statistic))
                .font(.caption)
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(iconName: "star.fill", statistic: 123)
    }
}
