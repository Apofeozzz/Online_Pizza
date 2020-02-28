//
//  CartTotalTableViewCell.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class CartTotalTableViewCell: UITableViewCell {
	
	// MARK: - CELL ID -
	
	static let id = "CartTotalTableViewCell"
	
	// MARK: - UIVIEW -
	
	var totalLabel: 	UILabel!
	
	var priceLabel: 	UILabel!
	
	var separatorView: 	UIView!
	
	// MARK: - INIT -
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		setupTotalLabel()
		
		setupPriceLabel()
		
		setupSeparatorView()
		
		setupConstraints()
		
	}
	
	private func setupTotalLabel() {
		
		totalLabel = UILabel()
		
		totalLabel.translatesAutoresizingMaskIntoConstraints = false
		
		totalLabel.font 		= UIFont.boldSystemFont(ofSize: 17)
		
		totalLabel.textColor 	= .primaryTextColor
		
		totalLabel.text 		= "TOTAL"
		
		addSubview(totalLabel)
		
	}
	
	private func setupPriceLabel() {
		
		priceLabel = UILabel()
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		priceLabel.font 		= UIFont.boldSystemFont(ofSize: 17)
		
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
		
			totalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 36),
			totalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
			totalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43)
		
		])
		
		NSLayoutConstraint.activate([
		
			priceLabel.topAnchor		.constraint(equalTo: totalLabel.topAnchor),
			priceLabel.bottomAnchor		.constraint(equalTo: totalLabel.bottomAnchor),
			priceLabel.trailingAnchor	.constraint(equalTo: trailingAnchor, constant: -12)
		
		])
		
		NSLayoutConstraint.activate([
		
			separatorView.bottomAnchor	.constraint(equalTo: bottomAnchor),
			separatorView.leadingAnchor	.constraint(equalTo: totalLabel.leadingAnchor),
			separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
			separatorView.heightAnchor	.constraint(equalToConstant: 1)
		
		])
		
	}
	
}
