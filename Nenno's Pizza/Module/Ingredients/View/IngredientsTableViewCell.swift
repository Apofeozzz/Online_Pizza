//
//  IngredientsTableViewCell.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 25.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
	
	static let id = "IngredientsTableViewCell"
	
	// MARK: - DATA SOURCE -
	
	var ingredient: Good? {
		
		didSet {
		
			nameLabel.text = ingredient?.name
			
			let priceString = "\(ingredient?.price ?? 0)".formatPrice
			
			priceLabel.text = "$\(priceString)"
			
		}
		
	}
	
	var wasSelected: Bool = false {
		
		didSet {
			
			if wasSelected { tickImageView.isHidden = false }
			
			else { tickImageView.isHidden = true }
			
		}
		
	}
	
	// MARK: - UIVIEW -
	
	var nameLabel: 	UILabel!
	
	var priceLabel: UILabel!
	
	var tickImageView: UIImageView!
	
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
		
		selectionStyle = .none
		
		setupTickImageView()
		
		setupNameLabel()
		
		setupPriceLabel()
		
		setupConstraints()
		
	}
	
	private func setupNameLabel() {
		
		nameLabel = UILabel()
		
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		nameLabel.textColor = .primaryTextColor
		
		nameLabel.font 		= .systemFont(ofSize: 17)
		
		addSubview(nameLabel)
		
	}
	
	private func setupPriceLabel() {
		
		priceLabel = UILabel()
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		priceLabel.textColor 	= .primaryTextColor
		
		priceLabel.font 		= .systemFont(ofSize: 17)
		
		addSubview(priceLabel)
		
	}
	
	private func setupTickImageView() {
		
		tickImageView = UIImageView(image: UIImage(named: "tick")?.withTintColor(.naviRed))
		
		tickImageView.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(tickImageView)
		
		tickImageView.isHidden = true
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			nameLabel.topAnchor		.constraint(equalTo: topAnchor, constant: 12),
			nameLabel.bottomAnchor	.constraint(equalTo: bottomAnchor, constant: -12),
			nameLabel.leadingAnchor	.constraint(equalTo: leadingAnchor, constant: 43),
		
		])
		
		NSLayoutConstraint.activate([
		
			tickImageView.centerYAnchor	.constraint(equalTo: centerYAnchor),
			tickImageView.leadingAnchor	.constraint(equalTo: leadingAnchor, constant: 15),
			tickImageView.heightAnchor	.constraint(equalToConstant: 10),
			tickImageView.widthAnchor	.constraint(equalToConstant: 13)
		
		])
		
		NSLayoutConstraint.activate([
		
			priceLabel.topAnchor		.constraint(equalTo: nameLabel.topAnchor),
			priceLabel.bottomAnchor		.constraint(equalTo: nameLabel.bottomAnchor),
			priceLabel.trailingAnchor	.constraint(equalTo: trailingAnchor, constant: -12)
		
		])
		
	}
	
}
