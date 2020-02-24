//
//  PizzaPriceView.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class PizzaPriceView: UIView {
	
	// MARK: - UIVIEW -
	
	var cartImageView: 	UIImageView!
	
	var priceLabel: 	UILabel!
	
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
		
		backgroundColor = UIColor.rgb(red: 255, green: 205, blue: 43)
		
		setupCartImageView()
		
		setupPriceLabel()
		
		setupConstraints()
		
	}
	
	private func setupCartImageView() {
		
		let cartImage = UIImage(named: "ic_cart_button")?.withTintColor(.white)
		
		cartImageView = UIImageView(image: cartImage)
		
		cartImageView.translatesAutoresizingMaskIntoConstraints = false
		
		cartImageView.contentMode = .scaleAspectFit
		
		cartImageView.tintColor = .white
		
		addSubview(cartImageView)
		
	}
	
	private func setupPriceLabel() {
		
		priceLabel = UILabel()
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
		
		priceLabel.textColor = .white
		
		addSubview(priceLabel)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			priceLabel.topAnchor		.constraint(equalTo: topAnchor, constant: 3),
			priceLabel.bottomAnchor		.constraint(equalTo: bottomAnchor, constant: -3),
			priceLabel.trailingAnchor	.constraint(equalTo: trailingAnchor, constant: -3),
			priceLabel.leadingAnchor	.constraint(equalTo: cartImageView.trailingAnchor, constant: 3)
			
		])
		
		NSLayoutConstraint.activate([
		
			cartImageView.topAnchor		.constraint(equalTo: priceLabel.topAnchor),
			cartImageView.bottomAnchor	.constraint(equalTo: priceLabel.bottomAnchor),
			cartImageView.leadingAnchor	.constraint(equalTo: leadingAnchor, constant: 3)
		
		])
		
	}
	
}
