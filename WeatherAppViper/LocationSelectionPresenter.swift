//
//  LocationSelectionPresenter.swift
//  WeatherAppViper
//
//  Created by João Carreira on 27/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//


final class LocationSelectionPresenter {
    
    var router: LocationSelectionRouterProtocol?
    
    weak var view: LocationSelectionPresenterToViewProtocol?
   
    init(router: LocationSelectionRouterProtocol) {
        self.router = router
    }
}


extension LocationSelectionPresenter: LocationSelectionViewToPresenterProtocol {

    var navigationBarTitle: String {
        return "Choose Location"
    }
    
    func close() {
        router?.closeLocationSelection()
    }
}
