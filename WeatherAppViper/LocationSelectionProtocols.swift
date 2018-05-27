//
//  LocationSelectionProtocols.swift
//  WeatherAppViper
//
//  Created by João Carreira on 27/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

protocol LocationSelectionRouterProtocol {
    
    func closeLocationSelection()
}


protocol LocationSelectionViewToPresenterProtocol: class {
    
    var navigationBarTitle: String { get }
    
    func close()
}


protocol LocationSelectionPresenterToViewProtocol: class { }
