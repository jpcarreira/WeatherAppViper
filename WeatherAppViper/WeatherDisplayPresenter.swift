//
//  WeatherDisplayPresenter.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//


final class WeatherDisplayPresenter {
    
    weak var router: WeatherDisplayRouterProtocol?
    
    weak var api: WeatherDisplayAPIProtocol?
}


extension WeatherDisplayPresenter: WeatherDisplayViewToPresenterProtocol {
    
    var navigationBarTitle: String {
        return "Weather App"
    }
}
