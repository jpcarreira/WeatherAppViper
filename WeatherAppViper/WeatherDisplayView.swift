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
    
    private let noWeatherLabel = UILabel()
    
    var weatherCondition: WeatherCondition? {
        didSet {
            updateView()
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        locationLabel.numberOfLines = 0
        locationLabel.textAlignment = .center
        addSubview(locationLabel)
        
        weatherDescriptionLabel.numberOfLines = 0
        weatherDescriptionLabel.textAlignment = .center
        addSubview(weatherDescriptionLabel)
        
        addSubview(iconImageView)
        
        temperatureLabel.numberOfLines = 0
        temperatureLabel.textAlignment = .center
        addSubview(temperatureLabel)
        
        windLabel.numberOfLines = 0
        windLabel.textAlignment = .center
        addSubview(windLabel)
        
        addSubview(noWeatherLabel)
        
        updateView()
    }
    
    private func updateView() {
        if let weatherCondition = weatherCondition {
            noWeatherLabel.isHidden = true
            locationLabel.text = weatherCondition.location
            weatherDescriptionLabel.text = weatherCondition.condition
            temperatureLabel.text = weatherCondition.temperature
            windLabel.text = weatherCondition.wind
            iconImageView.image = UIImage(named: weatherCondition.icon ?? "")
        } else {
            noWeatherLabel.isHidden = false
            noWeatherLabel.text = "Could not get weather data at this time.\nTry again later."
            noWeatherLabel.numberOfLines = 0
            noWeatherLabel.textAlignment = .center
        }
    }
    
    private func setupContraints() {
        locationLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(16)
            make.width.height.equalTo(120)
            make.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.trailing.equalTo(iconImageView.snp.leading)
        }
        
        windLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.leading.equalTo(iconImageView.snp.trailing)
        }
        
        noWeatherLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
