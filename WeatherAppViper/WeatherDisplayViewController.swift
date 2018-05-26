//
//  WeatherDisplayViewController.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import UIKit


final class WeatherDisplayViewController: UIViewController {
    
    let presenter: WeatherDisplayViewToPresenterProtocol
    
    let updateDisplayView = UpdateDisplayView()
    
    let weatherDisplayView = WeatherDisplayView()
    
    init(presenter: WeatherDisplayViewToPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = presenter.navigationBarTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
        presenter.getWeatherCondition()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(updateDisplayView)
        view.addSubview(weatherDisplayView)
    }
    
    private func setupConstraints() {
        updateDisplayView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UpdateDisplayView.viewHeight)
        }
        
        weatherDisplayView.snp.makeConstraints { make in
            make.top.equalTo(updateDisplayView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}


extension WeatherDisplayViewController: WeatherDisplayPresenterToViewProtocol {
    
    func update(with weatherCondition: WeatherCondition) {
        weatherDisplayView.weatherCondition = weatherCondition
    }
}
