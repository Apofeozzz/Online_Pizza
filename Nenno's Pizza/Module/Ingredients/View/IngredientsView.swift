//
//  IngredientsView.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 25.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class IngredientsView: UIView {
	
	// MARK: - UIVIEW -
	
	var backPizzaImageView: 	UIImageView!
	
	var pizzaImageView: 		UIImageView!
	
	var ingredientsTableView: 	UITableView!
	
	var addToCartButton:		UIButton!
	
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
		
		setupBackPizzaImageView()
		
		setupPizzaImageView()
		
		setupConstraints()
		
	}
	
	private func setupBackPizzaImageView() {
		
		backPizzaImageView = UIImageView()
		
		backPizzaImageView.translatesAutoresizingMaskIntoConstraints = false
		
		backPizzaImageView.image = UIImage(named: "bg_wood")
		
		backPizzaImageView.contentMode = .scaleToFill
		
		addSubview(backPizzaImageView)
		
	}
	
	private func setupPizzaImageView() {
		
		pizzaImageView = UIImageView()
		
		pizzaImageView.translatesAutoresizingMaskIntoConstraints = false
		
		pizzaImageView.contentMode = .scaleAspectFit
		
		pizzaImageView.clipsToBounds = true
		
		addSubview(pizzaImageView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			backPizzaImageView.topAnchor		.constraint(equalTo: topAnchor),
			backPizzaImageView.leadingAnchor	.constraint(equalTo: leadingAnchor),
			backPizzaImageView.trailingAnchor	.constraint(equalTo: trailingAnchor),
			backPizzaImageView.heightAnchor		.constraint(equalToConstant: 300)
		
		])
		
		NSLayoutConstraint.activate([
			
			pizzaImageView.topAnchor.constraint(equalTo: backPizzaImageView.topAnchor, constant: 10),
			pizzaImageView.bottomAnchor.constraint(equalTo: backPizzaImageView.bottomAnchor, constant: -10)
		
		])
		
	}
	
}
