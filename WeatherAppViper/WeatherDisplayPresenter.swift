//
//  WeatherDisplayPresenter.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//


final class WeatherDisplayPresenter {
    
    weak var router: WeatherDisplayRouterProtocol?
    
    var api: WeatherDisplayAPIProtocol?
    
    weak var view: WeatherDisplayPresenterToViewProtocol?
}


extension WeatherDisplayPresenter: WeatherDisplayViewToPresenterProtocol {

    var navigationBarTitle: String {
        return "Weather App"
    }
    
    func getWeatherCondition() {
        api?.getCurrentWeather(for: "New%20York", completionHandler: { (success, weatherCondition) in
            self.view?.update(with: success ? weatherCondition : nil)
        })
    }
}
