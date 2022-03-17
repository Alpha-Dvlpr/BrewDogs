//
//  Extensions.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import UIKit

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [ weak self ] in
            guard let wSelf = self else { return }
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async { wSelf.image = image }
                }
            }
        }
    }
}

extension UIStackView {
    
    func addArrangedSubviews(_ subviews: [UIView]) { subviews.forEach { self.addArrangedSubview($0) } }
}
