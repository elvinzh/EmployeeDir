//
//  ImageLoader.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-26.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    
    private let url: String?
    @Published private(set) var image: UIImage?
    
    init(url: String? = nil) {
        self.url = url
        loadImage()
    }
    
    @MainActor
    private func updateImage(image: UIImage?) {
        self.image = image
    }
    
    private func loadImage() {
        Task {
            if let imageUrl = URL(string: url ?? "") {
                let urlRequest = URLRequest(url: imageUrl, cachePolicy: .returnCacheDataElseLoad)
                
                let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest)
                if let cachedData = cachedResponse?.data {
                    await updateImage(image: UIImage(data: cachedData))
                } else {
                    let (data, response) = try await URLSession.shared.data(for:urlRequest)
                    if let httpRes = response as? HTTPURLResponse, httpRes.statusCode == 200 {
                        let cachedResponse = CachedURLResponse(response: response, data: data)
                        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
                        await updateImage(image: UIImage(data: data))
                    } else {
                        await updateImage(image: nil)
                    }
                }
            } else {
                await updateImage(image: nil)
            }
        }
    }
}
