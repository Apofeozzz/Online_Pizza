//
//  CartView.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class CartView: UIView {
	
	// MARK: - UI VIEW -
	
	var checkoutButton: UIButton!
	
	var cartTableView: 	UITableView!
	
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
	
		setupCheckoutButton()
		
		setupCartTableView()
		
		setupConstraints()
		
	}
	
	private func setupCartTableView() {
		
		cartTableView = UITableView()
		
		cartTableView.translatesAutoresizingMaskIntoConstraints = false
		
		cartTableView.register(CartViewTableViewCell.self,
							   forCellReuseIdentifier: CartViewTableViewCell.id)
		
		cartTableView.separatorStyle = .none
		
		addSubview(cartTableView)
		
	}
	
	private func setupCheckoutButton() {
		
		checkoutButton = UIButton(type: .system)
		
		checkoutButton.translatesAutoresizingMaskIntoConstraints = false
		
		checkoutButton.setTitle("CHECKOUT", for: .normal)
		
		checkoutButton.setTitleColor(.white, for: .normal)
		
		checkoutButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
		
		checkoutButton.backgroundColor = .naviRed
		
		addSubview(checkoutButton)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			checkoutButton.bottomAnchor		.constraint(equalTo: bottomAnchor),
			checkoutButton.leadingAnchor	.constraint(equalTo: leadingAnchor),
			checkoutButton.trailingAnchor	.constraint(equalTo: trailingAnchor),
			checkoutButton.heightAnchor		.constraint(equalToConstant: 50)
		
		])
		
		NSLayoutConstraint.activate([
		
			cartTableView.topAnchor		.constraint(equalTo: topAnchor),
			cartTableView.leadingAnchor	.constraint(equalTo: leadingAnchor),
			cartTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			cartTableView.bottomAnchor	.constraint(equalTo: checkoutButton.topAnchor)
		
		])
		
	}
	
}
