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
	
	var ingredientsLabel:		UILabel!
	
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
		
		setupIngredientLabel()
		
		setupIngredientsTableView()
		
		setupAddToCartButton()
		
		setupConstraints()
		
	}
	
	private func setupBackPizzaImageView() {
		
		backPizzaImageView = UIImageView()
		
		backPizzaImageView.translatesAutoresizingMaskIntoConstraints = false
		
		backPizzaImageView.image 		= UIImage(named: "bg_wood")
		
		backPizzaImageView.contentMode 	= .scaleToFill
		
		addSubview(backPizzaImageView)
		
	}
	
	private func setupPizzaImageView() {
		
		pizzaImageView = UIImageView()
		
		pizzaImageView.translatesAutoresizingMaskIntoConstraints = false
		
		pizzaImageView.contentMode 		= .scaleAspectFit
		
		pizzaImageView.clipsToBounds 	= true
		
		addSubview(pizzaImageView)
		
	}
	
	private func setupIngredientLabel() {
		
		ingredientsLabel = UILabel()
		
		ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
		
		ingredientsLabel.textColor 	= .primaryTextColor
		
		ingredientsLabel.font 		= UIFont.boldSystemFont(ofSize: 24)
		
		ingredientsLabel.text 		= "Ingredients"
		
		addSubview(ingredientsLabel)
		
	}
	
	private func setupIngredientsTableView() {
		
		ingredientsTableView = UITableView()
		
		ingredientsTableView.translatesAutoresizingMaskIntoConstraints = false
		
		ingredientsTableView.register(IngredientsTableViewCell.self,
									  forCellReuseIdentifier: IngredientsTableViewCell.id)
		
		addSubview(ingredientsTableView)
		
	}
	
	private func setupAddToCartButton() {
		
		addToCartButton = UIButton(type: .system)
		
		addToCartButton.translatesAutoresizingMaskIntoConstraints = false
		
		addToCartButton.setTitleColor(.white, for: .normal)
		
		addToCartButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
		
		addToCartButton.backgroundColor = UIColor.rgb(red: 255, green: 205, blue: 43)
		
		addSubview(addToCartButton)
		
	}
	
	func setupCartButtonTitle(price: String) {
		
		addToCartButton.setTitle("ADD TO CART ($\(price))", for: .normal)
		
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
			
			pizzaImageView.topAnchor		.constraint(equalTo: backPizzaImageView.topAnchor, constant: 10),
			pizzaImageView.bottomAnchor		.constraint(equalTo: backPizzaImageView.bottomAnchor, constant: -10),
			pizzaImageView.leadingAnchor	.constraint(equalTo: backPizzaImageView.leadingAnchor),
			pizzaImageView.trailingAnchor	.constraint(equalTo: backPizzaImageView.trailingAnchor)
		
		])
		
		NSLayoutConstraint.activate([
		
			ingredientsLabel.topAnchor		.constraint(equalTo: backPizzaImageView.bottomAnchor, constant: 24),
			ingredientsLabel.leadingAnchor	.constraint(equalTo: leadingAnchor, constant: 12)
		
		])
		
		NSLayoutConstraint.activate([
		
			ingredientsTableView.topAnchor		.constraint(equalTo: ingredientsLabel.bottomAnchor),
			ingredientsTableView.leadingAnchor	.constraint(equalTo: leadingAnchor),
			ingredientsTableView.trailingAnchor	.constraint(equalTo: trailingAnchor),
			ingredientsTableView.bottomAnchor	.constraint(equalTo: addToCartButton.topAnchor)
			
		])
		
		NSLayoutConstraint.activate([
		
			addToCartButton.bottomAnchor	.constraint(equalTo: bottomAnchor),
			addToCartButton.leadingAnchor	.constraint(equalTo: leadingAnchor),
			addToCartButton.trailingAnchor	.constraint(equalTo: trailingAnchor),
			addToCartButton.heightAnchor	.constraint(equalToConstant: 50)
		
		])
		
	}
	
}
