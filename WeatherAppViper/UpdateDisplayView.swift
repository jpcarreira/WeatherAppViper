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
    
    lazy private var lastUpdateDate: String = {
        // TODO: hardcoded for now
        return "2018-01-01 23:59"
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        infoLabel.text = "Last update: \(lastUpdateDate)"
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        addSubview(infoLabel)
    }
    
    private func setupContraints() {
        infoLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
