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
    
    weak var view: WeatherDisplayPresenterToViewProtocol?
}


extension WeatherDisplayPresenter: WeatherDisplayViewToPresenterProtocol {

    var navigationBarTitle: String {
        return "Weather App"
    }
    
    func getWeatherCondition() {
        // TODO: call the service to get a real weather condition
        let weatherCondition = WeatherCondition(
            location: "Lisbon", condition: "superb!", wind: "SSW 17km/h", temperature: "28 ºC",
            icon: nil)
        view?.update(with: weatherCondition)
    }
}
