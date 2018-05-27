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
    
    weak var delegate: LocationSelectionDelegate?
   
    init(router: LocationSelectionRouterProtocol) {
        self.router = router
    }
}


extension LocationSelectionPresenter: LocationSelectionViewToPresenterProtocol {

    var navigationBarTitle: String {
        return "Choose Location"
    }
    
    var dataSource: [String] {
        return [
            "Stockholm",
            "Lisbon",
            "Madrid",
            "Paris",
            "London",
            "Oslo",
            "Dublin",
            "Berlin",
            "Rome"
        ]
    }
    
    func didSelectRow(at index: Int) {
        delegate?.didSelect(dataSource[index])
        router?.closeLocationSelection()
    }
    
    func close() {
        router?.closeLocationSelection()
    }
}
