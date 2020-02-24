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
	
	var appNameLabel: UILabel!
	
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
		
		setupAppNameLabel()
		
		setupConstraints()
		
	}
	
	private func setupAppNameLabel() {
		
		appNameLabel = UILabel()
		
		appNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		appNameLabel.font 		= UIFont.boldSystemFont(ofSize: 24)
		
		appNameLabel.textColor 	= .naviRed
		
		appNameLabel.text		= "NENNO'S PIZZA"
		
		addSubview(appNameLabel)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			appNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			appNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		
		])
		
	}
	
}

