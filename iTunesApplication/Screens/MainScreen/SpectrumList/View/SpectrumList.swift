//
//  SpectrumList.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 15/11/2023.
//

import SwiftUI

struct SpectrumList: View {

    @StateObject private var viewModel = MainViewModel()
    @State private var searchBarText = ""
    private var filteredSpectrums: [SpectrumModel] {
        viewModel.seachSpectrums(searchText: searchBarText)
    }

    var body: some View {
        /// Навигация нашего приложения, чтобы мы могли вернуться к экрану
        NavigationStack {
            /// Скролл вью, чтобы могли скролить
            ///
            ScrollView(showsIndicators: false) {
                /// То же самое, что и VStack, но он ленивый. Т.е переиспользует ячейки. Используют, когда данных много.
                LazyVStack {
                    /// Тут перебираем наши треки. Т.к SpectrumModel подписан на `Identifiable` мы можем по нему итерироваться.
                    ForEach(filteredSpectrums) { Spectrum in
                        /// Это место, куда мы будем переходить при нажатии
                        NavigationLink {
                            /// Экран, который откроем при нажатии
                            SpectrumDetails(Spectrum: Spectrum)
                        } label: {
                            /// наша ячейка
                            SpecCell(Spectrum: Spectrum)
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal, 15)
                }
            }
            /// Фон
            .background(LinearGradient.appBackground)
            /// Наш сёрч бар выше
            .searchable(text: $searchBarText)
            /// Наш заголовок
//            .navigationBarname("Спектры")
        }
        /// Не теряем!
        .environmentObject(viewModel)
        /// Задаём тему всегда тёмную
        .colorScheme(.dark)
        /// Перед появлением экрана будем выполнять функцию fetchData
        .onAppear(perform: fetchData)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                fetchData()
            }, label: {
                Text("Обновить карточки")
            })
        }
    }
}

// MARK: - Network

private extension SpectrumList {

    func fetchData() {
        viewModel.getSpectrums { error in
            if let error {
                print(error.localizedDescription)
                viewModel.Spectrums = .mockData
            }
        }
    }
}

// MARK: - Preview

#Preview {
    SpectrumList()
    /// Не теряем!
        .environmentObject(MainViewModel())
}
