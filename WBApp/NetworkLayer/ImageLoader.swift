//
//  ImageLoader.swift
//  WBApp
//
//  Created by Назар Ткаченко on 27.07.2024.
//

import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: String?) {
        guard let urlString = url, let url = URL(string: urlString) else {
            self.image = nil
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
}
