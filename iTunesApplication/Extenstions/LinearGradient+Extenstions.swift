//
//  LinearGradient+Extenstions.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 16/11/2023.
//

import SwiftUI

extension LinearGradient {

    static let appBackground = LinearGradient(
        colors: [.black, .blue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let appBackgroundViolet = LinearGradient(
        colors: [.black, .red],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
