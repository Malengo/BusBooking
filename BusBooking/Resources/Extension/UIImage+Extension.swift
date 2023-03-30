//
//  UIImage+Extension.swift
//  BusBooking
//
//  Created by Jose Augusto on 30/03/23.
//

import UIKit
extension UIImage {
    func loadImageData(_ url: URL) async throws -> UIImage {
        var image: UIImage
        do {
            let request = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else { throw NSError.init(domain: "Error", code: 1)}
            guard httpResponse.statusCode == 200  else { throw NSError.init(domain: "Error", code: 2)}
            
            image = UIImage(data: data)!
            return image
        } catch {
            return UIImage()
        }
        
    }
}
