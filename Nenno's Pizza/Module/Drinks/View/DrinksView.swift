//
//  DrinksView.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/27/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class DrinksView: UIView {
	
	// MARK: - UIVIEW -
	
	var drinksTableView: 	UITableView!
	
	var addedToCartLabel:	UILabel!
	
	// MARK: - CONSTRAINTS -
	
	var addedToCartLabelTopConstraint: NSLayoutConstraint!
	
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
		
		setupDrinksTableView()
		
		setupAddedToCartLabel()
		
		setupConstraints()
		
	}
	
	private func setupDrinksTableView() {
		
		drinksTableView = UITableView()
		
		drinksTableView.translatesAutoresizingMaskIntoConstraints = false
		
		drinksTableView.register(DrinksTableViewCell.self, forCellReuseIdentifier: DrinksTableViewCell.id)
		
		drinksTableView.separatorStyle = .none
		
		addSubview(drinksTableView)
		
	}
	
	private func setupAddedToCartLabel() {
		
		addedToCartLabel = UILabel()
		
		addedToCartLabel.translatesAutoresizingMaskIntoConstraints = false
		
		addedToCartLabel.text = "ADDED TO CART"
		
		addedToCartLabel.textColor = .white
		
		addedToCartLabel.textAlignment = .center
		
		addedToCartLabel.font = .boldSystemFont(ofSize: 12)
		
		addedToCartLabel.backgroundColor = .naviRed
		
		addSubview(addedToCartLabel)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			drinksTableView.topAnchor		.constraint(equalTo: topAnchor),
			drinksTableView.leadingAnchor	.constraint(equalTo: leadingAnchor),
			drinksTableView.trailingAnchor	.constraint(equalTo: trailingAnchor),
			drinksTableView.bottomAnchor	.constraint(equalTo: bottomAnchor)
		
		])
		
		addedToCartLabelTopConstraint = addedToCartLabel.topAnchor.constraint(equalTo: topAnchor, constant: -150)
		
		NSLayoutConstraint.activate([
		
			addedToCartLabel.leadingAnchor	.constraint(equalTo: leadingAnchor),
			addedToCartLabel.trailingAnchor	.constraint(equalTo: trailingAnchor),
			addedToCartLabel.heightAnchor	.constraint(equalToConstant: 40),
			addedToCartLabelTopConstraint
		
		])
		
	}
	
}
