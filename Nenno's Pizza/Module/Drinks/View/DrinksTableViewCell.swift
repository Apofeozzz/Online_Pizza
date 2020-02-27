//
//  DrinksTableViewCell.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 27.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class DrinksTableViewCell: UITableViewCell {
	
	static let id = "DrinksTableViewCell"
	
	// MARK: - UIVIEW -
	
	var plusButton: 	UIButton!
	
	var plusImageView: 	UIImageView!
	
	var nameLabel: 		UILabel!
	
	var priceLabel: 	UILabel!
	
	var separateView:	UIView!
	
	var plusAction: () -> Void = {}
	
	// MARK: - DATA SOURCE -
	
	var drink: Drink? {
		
		didSet {
			
			guard let drink = drink else { return }
			
			nameLabel.text 	= drink.name
			
			priceLabel.text = "$\(drink.price ?? 0)".formatPrice
			
		}
		
	}
	
	// MARK: - INIT -
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - ACTIONS -
	
	@objc private func plusButtonAction() {
		
		plusAction()
		
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		selectionStyle = .none
		
		setupPlusButton()
		
		setupPlusImageView()
		
		setupNameLabel()
		
		setupPriceLabel()
		
		setupSeparateView()
		
		setupConstraints()
		
	}
	
	private func setupPlusButton() {
		
		plusButton = UIButton(type: .system)
		
		plusButton.translatesAutoresizingMaskIntoConstraints = false
		
		plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
		
		addSubview(plusButton)
		
	}
	
	private func setupPlusImageView() {
		
		let plusImage = UIImage(named: "plus")
		
		plusImageView = UIImageView(image: plusImage)
		
		plusImageView.translatesAutoresizingMaskIntoConstraints = false
		
		plusImageView.contentMode = .scaleAspectFit
		
		addSubview(plusImageView)
		
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
		
		priceLabel.textColor = .primaryTextColor
		
		priceLabel.font 		= .systemFont(ofSize: 17)
		
		addSubview(priceLabel)
		
	}
	
	private func setupSeparateView() {
		
		separateView = UIView()
		
		separateView.translatesAutoresizingMaskIntoConstraints = false
		
		separateView.backgroundColor = UIColor.rgb(red: 200, green: 199, blue: 204)
		
		addSubview(separateView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			plusButton.topAnchor	.constraint(equalTo: topAnchor),
			plusButton.leadingAnchor.constraint(equalTo: leadingAnchor),
			plusButton.bottomAnchor	.constraint(equalTo: bottomAnchor),
			plusButton.widthAnchor	.constraint(equalToConstant: 43)
		
		])
		
		NSLayoutConstraint.activate([
		
			plusImageView.centerXAnchor	.constraint(equalTo: plusButton.centerXAnchor),
			plusImageView.centerYAnchor	.constraint(equalTo: plusButton.centerYAnchor),
			plusImageView.widthAnchor	.constraint(equalToConstant: 12),
			plusImageView.heightAnchor	.constraint(equalToConstant: 12)
			
		])
		
		NSLayoutConstraint.activate([
		
			nameLabel.topAnchor		.constraint(equalTo: topAnchor, constant: 12),
			nameLabel.leadingAnchor	.constraint(equalTo: plusButton.trailingAnchor),
			nameLabel.bottomAnchor	.constraint(equalTo: bottomAnchor, constant: -12)
		
		])
		
		NSLayoutConstraint.activate([
		
			priceLabel.topAnchor		.constraint(equalTo: nameLabel.topAnchor),
			priceLabel.bottomAnchor		.constraint(equalTo: nameLabel.bottomAnchor),
			priceLabel.trailingAnchor	.constraint(equalTo: trailingAnchor, constant: -12)
		
		])
		
		NSLayoutConstraint.activate([
		
			separateView.bottomAnchor	.constraint(equalTo: bottomAnchor),
			separateView.leadingAnchor	.constraint(equalTo: nameLabel.leadingAnchor),
			separateView.trailingAnchor	.constraint(equalTo: trailingAnchor),
			separateView.heightAnchor	.constraint(equalToConstant: 1)
			
		])
		
	}
	
}
