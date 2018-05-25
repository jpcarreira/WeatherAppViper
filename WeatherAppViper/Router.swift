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
        presenter = WeatherDisplayPresenter()
        rootViewController =
            UINavigationController(
                rootViewController: WeatherDisplayViewController(presenter: presenter))
        presenter.router = self
        presenter.api = api
    }
}


extension Router: WeatherDisplayRouterProtocol { }
