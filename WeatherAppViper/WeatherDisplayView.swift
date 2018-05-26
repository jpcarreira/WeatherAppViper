//
//  WeatherDisplayView.swift
//  WeatherAppViper
//
//  Created by João Carreira on 26/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import UIKit
import SnapKit


final class WeatherDisplayView: UIView {
    
    private let locationLabel = UILabel()
    
    private let weatherDescriptionLabel = UILabel()
    
    private let temperatureLabel = UILabel()
    
    private let windLabel = UILabel()
    
    private let iconImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(locationLabel)
    }
    
    private func setupContraints() {
        
    }
}
