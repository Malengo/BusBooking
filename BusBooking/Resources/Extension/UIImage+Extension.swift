//
//  UIImage+Extension.swift
//  BusBooking
//
//  Created by Jose Augusto on 30/03/23.
//

import UIKit
extension UIImage {
    func loadImageData(_ url: URL) async throws -> UIImage {
        var image: UIImage = UIImage()
        
        do {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, erro in
                guard let httpResponse = response as? HTTPURLResponse else { return }
                guard httpResponse.statusCode == 200  else { return }
                
                image = UIImage(data: data!)!
            }.resume()
            return image
        }         
    }
}
