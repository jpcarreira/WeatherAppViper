//
//  WeatherDisplayProtocols.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

protocol WeatherDisplayAPIProtocol: class { }

protocol WeatherDisplayRouterProtocol: class { }

protocol WeatherDisplayViewToPresenterProtocol {
    
    var navigationBarTitle: String { get }
    
    func getWeatherCondition()
}

protocol WeatherDisplayPresenterToViewProtocol: class {
    
    func update(with weatherCondition: WeatherCondition?)
}
