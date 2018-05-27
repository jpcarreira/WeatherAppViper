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
    
    private var mockAPIPrompt: (canSwitch: Bool, alreadyPrompted: Bool)
    
    init(canSwitchToMockAPI: Bool = false) {
        self.mockAPIPrompt = (canSwitchToMockAPI, false)
    }
    
    private func requestForWeatherCondition(for location: String = "Faro") {
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
    
    func getWeatherCondition() {
        if mockAPIPrompt.canSwitch && !mockAPIPrompt.alreadyPrompted {
            promptForAPISwitch()
        } else {
            requestForWeatherCondition()
        }
    }
    
    func getLocations() {
        router?.goToLocationSelection(sender: self)
    }
    
    func chooseAPI(useMock: Bool = false) {
        router?.changeAPI(useMock: useMock)
        requestForWeatherCondition()
    }
}


extension WeatherDisplayPresenter: LocationSelectionDelegate {
    
    func didSelect(_ location: String) {
        requestForWeatherCondition(for: location)
    }
}
