//
//  SpectrumDetails.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 16/11/2023.
//

import SwiftUI

struct SpectrumDetails: View {
    @EnvironmentObject var viewModel: MainViewModel
    var Spectrum: SpectrumModel!

    var body: some View {
        GeometryReader {
            let size = $0.size
            ScrollView {
                VStack {
                    ImageView(size)

                    SpectrumTextInfo
                        .padding()
                }
            }
        }
        .padding(.horizontal)
        .environmentObject(viewModel)
//        .navigationBarname("", displayMode: .inline)
//        .colorScheme(.dark)
        .background(LinearGradient.appBackgroundViolet)
    }
}

// MARK: - SpectrumDetails

private extension SpectrumDetails {
    
    /// Вьюха картинки
    /// - Parameter size: размер фото
    /// - Returns: кастомную фотку
    func ImageView(_ size: CGSize) -> some View {
        AsyncImage(url: Spectrum.imageURL) { img in
            img
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.width)
                .clipShape(RoundedRectangle(cornerRadius: 20))

        } placeholder: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.shimmerColor)
                ProgressView()
            }
            .frame(width: size.width, height: size.width)
        }
    }
    
    /// Наше тело со всей текстой информацией
    var SpectrumTextInfo: some View {
        VStack {
            if let name = Spectrum.name {
                Text(name)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.secondary)
                    .padding(.bottom)
            }

            Text(Spectrum.name ?? "Название не указано")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 22, weight: .semibold, design: .rounded))

            Text(Spectrum.desc ?? "Описание не задано")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundStyle(.secondary)

            
            
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        SpectrumDetails(Spectrum: .mockData)
    }
    .environmentObject(MainViewModel())
}
