//
//  ViewController.swift
//  dog Api udacity task
//
//  Created by Mostafa Diaa on 1/28/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let randomUrl = dogApi.Endpoint.random.url
        dogApi.requestRandomImage(randomImageUrl: randomUrl , completionHandeler: self.handelRandom(dog:error:) )
    }
    
    
    func showImage(image:UIImage?,error:Error?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    func handelRandom(dog:dogImage?,error:Error?){
        guard let imageUrl = URL(string: (dog?.message ?? "") ) else {
            print(error?.localizedDescription ?? "")
            return
        }
        dogApi.convertUrlToImage(url: imageUrl, completionHandeler: self.showImage(image:error:))
        
    }
    
    
    
    // using JSONSerialization
    //                let json = try JSONSerialization.jsonObject(with: dogData, options: []) as! [String:Any]
    //                print(json)
    //                let url = URL(string: "\(json["message"]!)")
    //                let image = try Data(contentsOf: url!)
    //                DispatchQueue.main.async {
    //                    self.imageView.image = UIImage(data: image)
    //                }
    
}
