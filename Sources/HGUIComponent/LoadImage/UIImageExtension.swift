//
//  File.swift
//  
//
//  Created by Hugo Coutinho on 2024-04-13.
//

import UIKit

public extension UIImageView {
    func loadImage(with imageURL: URL) {
        let task = URLSession.shared.dataTask(with: imageURL) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
}
