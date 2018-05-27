//
//  LocationSelectionViewController.swift
//  WeatherAppViper
//
//  Created by João Carreira on 27/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import UIKit


final class LocationSelectionViewController: UIViewController {
    
    private let presenter: LocationSelectionViewToPresenterProtocol
    
    init(presenter: LocationSelectionViewToPresenterProtocol) {
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
    
    private func setupNavigationBar() {
        navigationItem.title = presenter.navigationBarTitle
        
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel, target: self, action: #selector(pressedCloseBarButton))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func setupView() {
        view.backgroundColor = .white
      
    }
    
    private func setupConstraints() {
    
    }
    
    @objc private func pressedCloseBarButton() {
        presenter.close()
    }
}


extension LocationSelectionViewController: LocationSelectionPresenterToViewProtocol { }
