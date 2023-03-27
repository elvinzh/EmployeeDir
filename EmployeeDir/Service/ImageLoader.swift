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
        
//        print("Finish")
//        print(url!)
//        print(URLCache.shared.currentMemoryUsage)
//        print(URLCache.shared.currentDiskUsage)
    }
    
    private func loadImage() {
//        print("LoadImage")
//        print(url!)
        Task {
            if let imageUrl = URL(string: url ?? "") {
                let urlRequest = URLRequest(url: imageUrl, cachePolicy: .returnCacheDataElseLoad)
                
//                let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest)
//                if let cachedData = cachedResponse?.data {
//                    NSLog("Cached")
//                    print(cachedData)
//                }
                
                let (data, response) = try await URLSession.shared.data(for:urlRequest)

//                NSLog("fetched")
//                print(data)

                if let httpRes = response as? HTTPURLResponse, httpRes.statusCode == 200 {
                    let image = UIImage(data: data)
                    await updateImage(image: image)
                } else {
                    await updateImage(image: nil)
                }
                
            } else {
                await updateImage(image: nil)
            }
        }
    }
}
