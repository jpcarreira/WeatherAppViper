//
//  WeatherDisplayViewController.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import UIKit


final class WeatherDisplayViewController: UIViewController {
    
    private let presenter: WeatherDisplayViewToPresenterProtocol
    
    private let updateDisplayView = UpdateDisplayView()
    
    private let weatherDisplayView = WeatherDisplayView()
    
    init(presenter: WeatherDisplayViewToPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.getWeatherCondition()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = presenter.navigationBarTitle
        
        let leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh, target: self, action: #selector(pressedRefreshBarButton))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search, target: self, action: #selector(pressedFindLocationsBarButton))
        navigationItem.rightBarButtonItem = rightBarButtonItem
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
    
    @objc private func pressedRefreshBarButton() {
        presenter.getWeatherCondition()
    }
    
    @objc private func pressedFindLocationsBarButton() {
        presenter.getLocations()
    }
}


extension WeatherDisplayViewController: WeatherDisplayPresenterToViewProtocol {
    
    func update(with weatherCondition: WeatherConditionEntityProtocol?) {
        DispatchQueue.main.async {
            self.updateDisplayView.lastUpdateDate = weatherCondition?.lastUpdate
            self.weatherDisplayView.weatherCondition = weatherCondition
        }
    }
    
    func promptForAPISwitch() {
        let alertController = UIAlertController(
            title: nil, message: "Choose API", preferredStyle: .actionSheet)
        
        let mockAPIAction = UIAlertAction(title: "Mock API", style: .default) { action in
            self.presenter.chooseAPI(useMock: true)
        }
        
        let apiAction = UIAlertAction(title: "Weather API", style: .default) { action in
            self.presenter.chooseAPI(useMock: false)
        }

        alertController.addAction(mockAPIAction)
        alertController.addAction(apiAction)
        
        present(alertController, animated: true, completion:nil)
    }
}
