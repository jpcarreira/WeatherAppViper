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
    
    private var locationsTableView = UITableView()
    
    init(presenter: LocationSelectionViewToPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        locationsTableView.dataSource = self
        locationsTableView.delegate = self
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
      
        view.addSubview(locationsTableView)
    }
    
    private func setupConstraints() {
        locationsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func pressedCloseBarButton() {
        presenter.close()
    }
}


extension LocationSelectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.dataSource[indexPath.row]
        return cell
    }
}


extension LocationSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath.row)
    }
}
