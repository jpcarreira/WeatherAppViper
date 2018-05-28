//
//  UIImage+Extension.swift
//  WeatherAppViper
//
//  Created by João Carreira on 28/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func blur(_ image: UIImage, on imageView: inout UIImageView) -> UIImageView {
        imageView = UIImageView(frame: .zero)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.8
        blurEffectView.frame = imageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurEffectView)
    
        return imageView
    }
}
