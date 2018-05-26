//
//  WeatherDisplayProtocols.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

protocol WeatherDisplayAPIProtocol: class {
    func getCurrentWeather(
        for location: String,
        completionHandler: @escaping (Bool, WeatherConditionEntityProtocol?) -> Void)
}


protocol WeatherDisplayRouterProtocol: class { }


protocol WeatherConditionEntityProtocol {
    var location: String { get }
    var isDay: Bool { get }
    var condition: String { get }
    var wind: String { get }
    var temperature: String { get }
    var icon: String? { get }
}


protocol WeatherDisplayViewToPresenterProtocol {
    
    var navigationBarTitle: String { get }
    
    func getWeatherCondition()
}


protocol WeatherDisplayPresenterToViewProtocol: class {
    
    func update(with weatherCondition: WeatherConditionEntityProtocol?)
}
