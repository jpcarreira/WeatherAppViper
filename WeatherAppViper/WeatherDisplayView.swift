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
    
    var weatherCondition: WeatherConditionEntityProtocol? {
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
        addSubview(iconImageView)
        
        weatherDescriptionLabel.numberOfLines = 0
        weatherDescriptionLabel.textAlignment = .left
        weatherDescriptionLabel.textColor = .white
        addSubview(weatherDescriptionLabel)
        
        temperatureLabel.numberOfLines = 0
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = .white
        temperatureLabel.font = temperatureLabel.font.withSize(70)
        addSubview(temperatureLabel)
        
        windLabel.numberOfLines = 0
        windLabel.textAlignment = .left
        windLabel.textColor = .white
        addSubview(windLabel)
        
        locationLabel.numberOfLines = 0
        locationLabel.textAlignment = .center
        locationLabel.textColor = .white
        locationLabel.font = locationLabel.font.withSize(30)
        addSubview(locationLabel)
        
        noWeatherLabel.numberOfLines = 0
        noWeatherLabel.textAlignment = .center
        noWeatherLabel.textColor = .white
        noWeatherLabel.font = noWeatherLabel.font.withSize(12)
        addSubview(noWeatherLabel)
        
        updateView()
    }
    
    private func updateView() {
        if let weatherCondition = weatherCondition {
            locationLabel.text = weatherCondition.location
            weatherDescriptionLabel.text = weatherCondition.condition
            temperatureLabel.text = weatherCondition.temperature
            windLabel.text = weatherCondition.wind
            iconImageView.image = UIImage(named: weatherCondition.icon ?? "")
        } else {
            noWeatherLabel.text = "Could not get weather data at this time.\nTry again later."
            noWeatherLabel.numberOfLines = 0
            noWeatherLabel.textAlignment = .center
        }
        
        noWeatherLabel.isHidden = weatherCondition != nil
        locationLabel.isHidden = weatherCondition == nil
        weatherDescriptionLabel.isHidden = weatherCondition == nil
        temperatureLabel.isHidden = weatherCondition == nil
        windLabel.isHidden = weatherCondition == nil
        iconImageView.isHidden = weatherCondition == nil
    }
    
    private func setupContraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(6)
            make.leadingMargin.equalTo(iconImageView.snp.centerX)
        }
        
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(6)
            make.leadingMargin.equalTo(iconImageView.snp.centerX)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
        }
        
        noWeatherLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
