//
//  ViewController.swift
//  udacity-ios-nd-networking
//
//  Created by Mostafa Diaa on 1/28/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    
   let http = links.http.rawValue
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showImage(_ sender: Any) {
        guard let url = URL(string: http) else {
            print("Cannot create URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)
            in
            guard let imageData = data else {
                // print("no data, or there was an error")
                return
            }
            DispatchQueue.main.async {
                self.image.image = UIImage(data: imageData)
                
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    

}

