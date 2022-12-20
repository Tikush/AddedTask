//
//  UIImageVIew-Extension.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 17.12.22.
//

import SVGKit

extension UIImageView {
    func loadSVG(url: String) {
        
        guard let urlString = URL(string: url) else { return }
        
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: urlString) {
                if let image = SVGKImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image.uiImage
                    }
                }
            }
        }
    }
}
