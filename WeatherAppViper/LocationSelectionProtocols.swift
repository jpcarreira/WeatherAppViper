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
    
    var dataSource: [String] { get }
    
    func didSelectRow(at index: Int)
    
    func close()
}


protocol LocationSelectionPresenterToViewProtocol: class { }


protocol LocationSelectionDelegate: class  {
    
    func didSelect(_ location: String)
}
