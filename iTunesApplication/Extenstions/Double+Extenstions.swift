//
//  Double+Extenstions.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 16/11/2023.
//

import Foundation

extension Double? {

    var toString: String? {
        guard let self else { return nil }
        return "\(self)"
    }
}
