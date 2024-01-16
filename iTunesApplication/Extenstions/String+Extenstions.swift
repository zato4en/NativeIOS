//
//  String+Extenstions.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 16/11/2023.
//

import Foundation

extension String {

    var toURL: URL? { URL(string: self) }
}
