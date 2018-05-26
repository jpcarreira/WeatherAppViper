//
//  UpdateDisplayView.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import UIKit
import SnapKit


final class UpdateDisplayView: UIView {
    
    static let viewHeight = 100
    
    private let infoLabel = UILabel()
    
    var lastUpdateDate: String? {
        didSet {
            setupInfoLabel()
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupInfoLabel()
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        addSubview(infoLabel)
    }
    
    private func setupContraints() {
        infoLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupInfoLabel() {
        if let date = lastUpdateDate {
            infoLabel.text = "Last update: \(date)"
        } else {
            infoLabel.text = "No data to display"
        }
    }
}
