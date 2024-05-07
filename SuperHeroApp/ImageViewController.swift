//
//  ImageViewController.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    var url : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if let u = URL(string: url) {
            URLSession.shared.dataTask(with: u) { (data, response, error) in
              // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  self.img.image = UIImage(data: imageData)
                  
              }
            }.resume()
          }
//        NetworkService.Shared.getImage(url: url) { result in
//            switch result{
//            case .success(let imageFromURL):
//                DispatchQueue.main.async {
//                    self.img.image = imageFromURL
//                }
//                break
//            case .failure(_): break
//
//            }
//        }
        
    }

}
