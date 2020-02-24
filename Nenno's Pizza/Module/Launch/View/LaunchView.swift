//
//  LaunchView.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class LaunchView: UIView {
    
    // MARK: - UIVIEW -
    
    var pizzaTableView: UITableView!
    
    // MARK: - INIT -
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupPizzaTableView()
        
        setupConstraints()
        
    }
    
    private func setupPizzaTableView() {
        
        pizzaTableView = UITableView()
        
        pizzaTableView.translatesAutoresizingMaskIntoConstraints = false
        
        pizzaTableView.register(PizzaTableViewCell.self, forCellReuseIdentifier: PizzaTableViewCell.cellId)
        
        addSubview(pizzaTableView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            pizzaTableView.topAnchor        .constraint(equalTo: topAnchor),
            pizzaTableView.leadingAnchor    .constraint(equalTo: leadingAnchor),
            pizzaTableView.trailingAnchor   .constraint(equalTo: trailingAnchor),
            pizzaTableView.bottomAnchor     .constraint(equalTo: bottomAnchor)
        
        ])
        
    }
    
}
