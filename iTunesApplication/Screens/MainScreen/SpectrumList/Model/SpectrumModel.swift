//
//  SpectrumModel.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 15/11/2023.
//

import Foundation

struct SpectrumModel: Identifiable {
    let id = UUID()
    var specId: Int?
    var name: String?
    var len: Float?
    var freq: Float?
    var desc: String?
    var imageURL: URL?
}

// MARK: - Mock data

extension SpectrumModel {

    static let mockData = SpectrumModel(
        specId: 12312,
        name: "mockSpectrum",
        desc: "mockDesc",
        imageURL: .mockData
    )
}

extension [SpectrumModel] {

    static let mockData = (1...20).map {
        SpectrumModel(
            specId: $0,
            name: "CMB mock name\($0)",
            desc: "Desc mock\($0)",
            imageURL: .mockData
        )
    }
}

private extension URL {

    static let mockData = URL(string: "http://172.20.10.12:9000/spectrumbucket/default.jpeg")
}
