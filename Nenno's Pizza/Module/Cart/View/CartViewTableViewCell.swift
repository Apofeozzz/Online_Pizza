//
//  CartViewTableViewCell.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class CartViewTableViewCell: UITableViewCell {
	
	static let id = "CartViewTableViewCell"
	
	// MARK: - UIVIEW -
	
	var deleteButton: 	UIButton!
	
	var closeImageView: UIImageView!
	
	var itemNameLabel: 	UILabel!
	
	var priceLabel: 	UILabel!
	
	var separatorView: 	UIView!
	
	// MARK: - INIT -
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		
		setupView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		setupDeleteButton()
		
		setupCloseImageView()
		
		setupItemNameLabel()
		
		setupPriceLabel()
		
		setupSeparatorView()
		
		setupConstraints()
		
	}
	
	private func setupDeleteButton() {
		
		deleteButton = UIButton(type: .system)
		
		deleteButton.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(deleteButton)
		
	}
	
	private func setupCloseImageView() {
		
		let xImage = UIImage(named: "close")
		
		closeImageView = UIImageView(image: xImage)
		
		closeImageView.translatesAutoresizingMaskIntoConstraints = false
		
		closeImageView.contentMode = .scaleAspectFit
		
		addSubview(closeImageView)
		
	}
	
	private func setupItemNameLabel() {
		
		itemNameLabel = UILabel()
		
		itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		itemNameLabel.font 		= .systemFont(ofSize: 17)
		
		itemNameLabel.textColor = .primaryTextColor
		
		itemNameLabel.text = "Hello world"
		
		addSubview(itemNameLabel)
		
	}
	
	private func setupPriceLabel() {
		
		priceLabel = UILabel()
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		priceLabel.font 		= .systemFont(ofSize: 17)
		
		priceLabel.textColor 	= .primaryTextColor
		
		addSubview(priceLabel)
		
	}
	
	private func setupSeparatorView() {
		
		separatorView = UIView()
		
		separatorView.translatesAutoresizingMaskIntoConstraints = false
		
		separatorView.backgroundColor = UIColor.rgb(red: 200, green: 199, blue: 204)
		
		addSubview(separatorView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			deleteButton.leadingAnchor	.constraint(equalTo: leadingAnchor),
			deleteButton.topAnchor		.constraint(equalTo: topAnchor),
			deleteButton.bottomAnchor	.constraint(equalTo: bottomAnchor),
			deleteButton.widthAnchor	.constraint(equalToConstant: 43)
		
		])
		
		NSLayoutConstraint.activate([
		
			closeImageView.centerYAnchor.constraint(equalTo: deleteButton.centerYAnchor),
			closeImageView.centerXAnchor.constraint(equalTo: deleteButton.centerXAnchor),
			closeImageView.widthAnchor	.constraint(equalToConstant: 10),
			closeImageView.heightAnchor	.constraint(equalToConstant: 10)
		
		])
		
		NSLayoutConstraint.activate([
		
			itemNameLabel.topAnchor		.constraint(equalTo: topAnchor, 	constant: 12),
			itemNameLabel.bottomAnchor	.constraint(equalTo: bottomAnchor, 	constant: -12),
			itemNameLabel.leadingAnchor	.constraint(equalTo: deleteButton.trailingAnchor)
		
		])
		
		NSLayoutConstraint.activate([
		
			priceLabel.topAnchor		.constraint(equalTo: itemNameLabel.topAnchor),
			priceLabel.bottomAnchor		.constraint(equalTo: itemNameLabel.bottomAnchor),
			priceLabel.trailingAnchor	.constraint(equalTo: trailingAnchor, constant: -12),
			priceLabel.leadingAnchor	.constraint(equalTo: itemNameLabel.trailingAnchor, constant: -10)
		
		])
		
		NSLayoutConstraint.activate([
		
			separatorView.bottomAnchor	.constraint(equalTo: bottomAnchor),
			separatorView.leadingAnchor	.constraint(equalTo: itemNameLabel.leadingAnchor),
			separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
			separatorView.heightAnchor	.constraint(equalToConstant: 1)
		
		])
		
	}
	
}
