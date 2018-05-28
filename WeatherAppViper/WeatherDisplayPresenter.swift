//
//  WeatherDisplayPresenter.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//


final class WeatherDisplayPresenter {
    
    var router: WeatherDisplayRouterProtocol?
    
    var api: WeatherDisplayAPIProtocol?
    
    weak var view: WeatherDisplayPresenterToViewProtocol?
    
    private var location: String = "Stockholm" {
        didSet {
            view?.update(backgroundImageFor: location)
        }
    }
    
    private var mockAPIPrompt: (canSwitch: Bool, alreadyPrompted: Bool)
    
    init(canSwitchToMockAPI: Bool = false) {
        self.mockAPIPrompt = (canSwitchToMockAPI, false)
    }
    
    private func requestForWeatherCondition(for location: String) {
        api?.getCurrentWeather(for: location, completionHandler: { (success, weatherCondition) in
            self.view?.update(with: success ? weatherCondition : nil)
        })
    }
    
    private func promptForAPISwitch() {
        mockAPIPrompt.alreadyPrompted = true
        view?.promptForAPISwitch()
    }
}


extension WeatherDisplayPresenter: WeatherDisplayViewToPresenterProtocol {
    
    var navigationBarTitle: String {
        return "Weather App"
    }
    
    var backgroundImageUrl: String {
        return location
    }
    
    func getWeatherCondition() {
        if mockAPIPrompt.canSwitch && !mockAPIPrompt.alreadyPrompted {
            promptForAPISwitch()
        } else {
            requestForWeatherCondition(for: location)
        }
    }
    
    func getLocations() {
        router?.goToLocationSelection(sender: self)
    }
    
    func chooseAPI(useMock: Bool = false) {
        router?.changeAPI(useMock: useMock)
        requestForWeatherCondition(for: location)
    }
}


extension WeatherDisplayPresenter: LocationSelectionDelegate {
    
    func didSelect(_ location: String) {
        self.location = location
        requestForWeatherCondition(for: location)
    }
}
