//
//  DogApi.swift
//  dog Api udacity task
//
//  Created by Mostafa Diaa on 1/28/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import Foundation
import UIKit
class dogApi {
    enum Endpoint: String {
        case random = "https://dog.ceo/api/breeds/image/random"
        var url: URL {
            return URL(string: rawValue)!
        }
    }

    class func convertUrlToImage(url: URL, completionHandeler: @escaping (UIImage?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let imageData = data else {
                completionHandeler(nil, error)
                print("can't get the data")
                return
            }
            let downloadedImage = UIImage(data: imageData)!
            completionHandeler(downloadedImage, nil)
        }
        task.resume()
    }

    class func requestRandomImage(randomImageUrl: URL, completionHandeler: @escaping (dogImage?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: randomImageUrl) { data, _, error in
            guard let dogData = data else {
                print("somthing wrong")
                completionHandeler(nil, error)
                return
            }
            do {
                //  using codeable
                let decoder = JSONDecoder()
                let imageData = try decoder.decode(dogImage.self, from: dogData)
                completionHandeler(imageData, nil)
            } catch {
                print(error)
                completionHandeler(nil, error)
            }
        }
        task.resume()
    }
}
