//
//  Router.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import UIKit


final class Router {
    
    var api: ApiProtocol
    
    let presenter: WeatherDisplayPresenter
    
    let rootViewController: UINavigationController
    
    init(api: ApiProtocol) {
        self.api = api
        
        #if DEBUG
            presenter = WeatherDisplayPresenter(canSwitchToMockAPI: true)
        #else
            presenter = WeatherDisplayPresenter()
        #endif
        
        let viewController = WeatherDisplayViewController(presenter: presenter)
        rootViewController =
            UINavigationController(
                rootViewController: viewController)
        presenter.router = self
        presenter.api = api
        presenter.view = viewController
    }
}


extension Router: WeatherDisplayRouterProtocol {
    
    func changeAPI(useMock: Bool) {
        if useMock {
            api = MockAPI()
            presenter.api = api
        }
    }
    
    func goToLocationSelection() {
        let presenter = LocationSelectionPresenter(router: self)
        let viewController = LocationSelectionViewController(presenter: presenter)
        presenter.view = viewController
        
        rootViewController.present(
            UINavigationController(rootViewController: viewController), animated: true,
            completion: nil)
    }
}


extension Router: LocationSelectionRouterProtocol {
    
    func closeLocationSelection() {
        UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.dismiss(
            animated: true) 
    }
}
