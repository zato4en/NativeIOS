//
//  SpecCell.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 15/11/2023.
//

import SwiftUI

struct SpecCell: View {

    @EnvironmentObject var viewModel: MainViewModel
    @State private var heartIsSelected = false
    var Spectrum: SpectrumModel!
    
    /// Наша вьюха
    var body: some View {
        VStack {
            AsyncImage(url: Spectrum.imageURL) { img in
                img
                /// Говорим, что будем менять размеры фото
                    .resizable()
                /// Формат фото  ration - fill
                    .aspectRatio(contentMode: .fill)
                /// Задаём размер фото 100 на 100
                    .frame(width: 200, height: 150)
                /// Вырезаем фигуру RoundedRectangle с углами 20 градусов. Т.е просто делаем углы у нашего фото
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } placeholder: {
                ZStack {
                    /// Просто прямоугольник с углам 20
                    RoundedRectangle(cornerRadius: 20)
                    /// Это цвет прямоугольника. shimmerColor - наш кастомный цвет из файла `Color+Extenstions`
                        .fill(Color.shimmerColor)
                    /// Это наш лоудер, который крутится
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            }

            VStack(spacing: 10) {
                Text(Spectrum.name ?? "Название не указано")
                /// Задаём фон текста
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                /// Тот же фрейм. Нам надо центрировать текст по левой стороне. Т.е делаем ширину infinity и выравнивание по левой части
                    .frame(maxWidth: .infinity, alignment: .center)
                /// Выравнивание многострочного текста
                    .multilineTextAlignment(.leading)
                /// Цвет текста из `Color+Extenstions`
                    .foregroundStyle(Color.appForeground)
                /// Ограничение числа строк. `0` - это неограниченно, 1 - это одна. 2 - две и тд
                    .lineLimit(2)
                Text(Spectrum.desc ?? "Описание не задано")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(Color.appForeground.opacity(0.4))
                    .lineLimit(1)
            }
            /// Это наш отступ по горизонтали
            .padding(.horizontal, 5)

            

            
        }
        /// Наш EnvironmentObject var viewModel: MainViewModel
        .environmentObject(viewModel)
    }
}

// MARK: - Preview

/// Это наше превью, которая создаём экран справа
#Preview {
    /// .mockData - наш мок данных для превью справа
    SpecCell(Spectrum: .mockData)
        .padding()
    /// Важно! Без этого не будет работать превью. Будет крашится
        .environmentObject(MainViewModel())
    /// Задаём задний фон, используя градиент
        .background(LinearGradient.appBackground)
}
