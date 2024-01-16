//
//  MainViewModel.swift
//  iTunesApplication
//
//  Created by M Lavrenov on 15/11/2023.
//

import Foundation

protocol MainViewModelProtocol {
    func seachSpectrums(searchText: String) -> [SpectrumModel]
    func pressedLike(specId: Int, isLiked: Bool, completion: (() -> Void)?)
    func getSpectrums(completion: @escaping (Error?) -> Void)
}

final class MainViewModel: ObservableObject {

    @Published var Spectrums: [SpectrumModel] = []
}

// MARK: - MainViewModelProtocol

extension MainViewModel: MainViewModelProtocol {
    
    /// Получение треков
    /// - Parameter completion: комлишн блок с ошибкой, если она есть
    func getSpectrums(completion: @escaping (Error?) -> Void) {
        APIManager.shared.getSpectrums { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                Spectrums = data
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }

    /// Фильтрация при поиске
    /// - Parameter searchText: текст из сёрч бара
    /// - Returns: массив отфильтрованных песен
    func seachSpectrums(searchText: String) -> [SpectrumModel] {
        searchText.isEmpty
        ? Spectrums
        : Spectrums.filter {
            ($0.name ?? "Название не указано").contains(searchText)
//            || ($0.desc ?? "Описание не задано").contains(searchText)
        }
    }
    
    /// Нажатие кнопки лайка у ячейки
    /// - Parameters:
    ///   - specId: `id` нажатого трека
    ///   - isLiked: статус лайка
    func pressedLike(specId: Int, isLiked: Bool, completion: (() -> Void)? = nil) {
        print("Вы нажали спектр с id: \(specId). Статус: \(isLiked)")

        // Дальше пишите бизнес логику ...
        
        /// Здесь мы делаем имитацию запроса в интернет, т.е задержку на 1 секунду.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?()
        }
    }
}
