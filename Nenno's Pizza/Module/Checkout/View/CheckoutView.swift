//
//  CheckoutView.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class CheckoutView: UIView {
	
	// MARK: - UIVIEW -
	
	var thankYouLabel: 	UILabel!
	
	var bottomView: 	UIView!
	
	// MARK: - INIT -
	
	init() {
		super.init(frame: .zero)
		
		translatesAutoresizingMaskIntoConstraints = false
		
		setupView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		setupThankYouLabel()
		
		setupBottomView()
		
		setupConstraints()
		
	}
	
	private func setupThankYouLabel() {
		
		thankYouLabel = UILabel()
		
		thankYouLabel.translatesAutoresizingMaskIntoConstraints = false
		
		thankYouLabel.font 			= .italicSystemFont(ofSize: 34)
		
		thankYouLabel.textColor 	= .naviRed
		
		thankYouLabel.text 			= "Thank you\nfor your order!"
		
		thankYouLabel.textAlignment = .center
		
		thankYouLabel.numberOfLines = 0
		
		addSubview(thankYouLabel)
		
	}
	
	private func setupBottomView() {
		
		bottomView = UIView()
		
		bottomView.translatesAutoresizingMaskIntoConstraints = false
		
		bottomView.backgroundColor = .naviRed
		
		addSubview(bottomView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			thankYouLabel.centerYAnchor	.constraint(equalTo: centerYAnchor),
			thankYouLabel.centerXAnchor	.constraint(equalTo: centerXAnchor),
			thankYouLabel.leadingAnchor	.constraint(equalTo: leadingAnchor),
			thankYouLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
			
		
		])
		
		NSLayoutConstraint.activate([
		
			bottomView.bottomAnchor		.constraint(equalTo: bottomAnchor),
			bottomView.leadingAnchor	.constraint(equalTo: leadingAnchor),
			bottomView.trailingAnchor	.constraint(equalTo: trailingAnchor),
			bottomView.heightAnchor		.constraint(equalToConstant: 50)
		
		])
		
	}
	
}
