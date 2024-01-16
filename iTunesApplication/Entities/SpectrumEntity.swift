//
//  SpectrumEntity.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 16/11/2023.
//

import Foundation

struct SpectrumEntity: Decodable {
    var id: Int
    var name: String?
    var len: Float?
    var freq: Float?
    var description: String?
    var image_url: String?
}

// MARK: - Mapper

extension SpectrumEntity {

    var mapper: SpectrumModel {
        SpectrumModel(
            specId: id,
            name: name,
            len: len,
            freq: freq,
            desc: description,
            imageURL: ((image_url ?? "")).replacingOccurrences(of: "127.0.0.1", with: "172.20.10.12").toURL
        )
    }
}
