//
//  PizzaTableViewCell.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit
import Kingfisher

class PizzaTableViewCell: UITableViewCell {
    
    static let cellId = "PizzaTableViewCell"
    
    // MARK: - UIVIEW -
	
	var backImageView:		UIImageView!
	
	var pizzaImageView: 	UIImageView!
	
	var pizzaNameLabel: 	UILabel!
	
	var ingredientsLabel: 	UILabel!
	
	var priceView: 			PizzaPriceView!
	
	var greyView:			UIView!
    
    // MARK: - DATA SOURCE -
	
	var basePrice: Double = 0 {
		
		willSet {
			
			priceView.priceLabel.text = "$\(newValue)".formatPrice
			
		}
		
	}
    
    var pizza: Pizza? {
        
        willSet {
            
			pizzaNameLabel.text = newValue?.name
			
			var string = ""
			
			guard let ingredients = newValue?.ingredients else { return }
			
			for (index, ingredient) in ingredients.enumerated() {
				
				for good in GoodsList.shared.goods {
					
					if good.id == ingredient {
						
						if index != 0 { string += good.name.lowercased() }
						
						else { string += good.name }
						
						if index < ingredients.count - 1 { string += ", " }
						
						basePrice += good.price
	
					}
					
				}
				
			}
			
			ingredientsLabel.text = string
			
			if let imageUrl = newValue?.imageUrl, let url = URL(string: imageUrl) {
				
				pizzaImageView.kf.setImage(with: url)
				
			}
            
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
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
		
		setupBackImageView()
        
		setupPizzaImageView()
		
		setupGrayView()
		
		setupPizzaNameLabel()
		
		setupPizzaPriceLabel()
		
		setupPizzaIngredientsLabel()
		
        setupConstraints()
        
    }
	
	private func setupBackImageView() {
		
		backImageView = UIImageView()
		
		backImageView.translatesAutoresizingMaskIntoConstraints = false
		
		backImageView.image = UIImage(named: "bg_wood")
		
		backImageView.contentMode = .scaleToFill
		
		addSubview(backImageView)
		
	}
	
	private func setupPizzaImageView() {
		
		pizzaImageView = UIImageView()
		
		pizzaImageView.translatesAutoresizingMaskIntoConstraints = false
		
		pizzaImageView.contentMode = .scaleAspectFill
		
		pizzaImageView.clipsToBounds = true
		
		addSubview(pizzaImageView)
		
	}
	
	private func setupGrayView() {
		
		greyView = UIView()
		
		greyView.translatesAutoresizingMaskIntoConstraints = false
		
		greyView.backgroundColor = .white
		
		greyView.layer.opacity = 0.9
		
		addSubview(greyView)
		
	}
	
	private func setupPizzaNameLabel() {
		
		pizzaNameLabel = UILabel()
		
		pizzaNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		pizzaNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
		
		pizzaNameLabel.textColor = .primaryTextColor
		
		addSubview(pizzaNameLabel)
		
	}
	
	private func setupPizzaIngredientsLabel() {
		
		ingredientsLabel = UILabel()
		
		ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
		
		ingredientsLabel.font = UIFont.systemFont(ofSize: 14)
		
		ingredientsLabel.textColor = UIColor.rgb(red: 74, green: 74, blue: 74)
		
		ingredientsLabel.numberOfLines = 0
		
		addSubview(ingredientsLabel)
		
	}
	
	private func setupPizzaPriceLabel() {
		
		priceView = PizzaPriceView()
		
		priceView.translatesAutoresizingMaskIntoConstraints = false
		
		priceView.layer.cornerRadius = 5
		
		addSubview(priceView)
		
	}
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
		
		NSLayoutConstraint.activate([
        
			backImageView.topAnchor		.constraint(equalTo: topAnchor),
			backImageView.leadingAnchor	.constraint(equalTo: leadingAnchor),
			backImageView.trailingAnchor	.constraint(equalTo: trailingAnchor),
			backImageView.bottomAnchor		.constraint(equalTo: bottomAnchor),
			backImageView.heightAnchor		.constraint(equalToConstant: 180)
        
        ])
        
        NSLayoutConstraint.activate([
        
			pizzaImageView.topAnchor		.constraint(equalTo: topAnchor),
			pizzaImageView.leadingAnchor	.constraint(equalTo: leadingAnchor, constant: 20),
			pizzaImageView.trailingAnchor	.constraint(equalTo: trailingAnchor, constant:  -20),
			pizzaImageView.bottomAnchor		.constraint(equalTo: bottomAnchor)
			
        
        ])
		
		NSLayoutConstraint.activate([
		
			greyView.bottomAnchor.constraint(equalTo: bottomAnchor),
			greyView.leadingAnchor.constraint(equalTo: leadingAnchor),
			greyView.trailingAnchor.constraint(equalTo: trailingAnchor),
			greyView.topAnchor.constraint(equalTo: pizzaNameLabel.topAnchor, constant: -10)
		
		])
		
		NSLayoutConstraint.activate([
		
			priceView.bottomAnchor		.constraint(equalTo: bottomAnchor, constant: -12),
			priceView.trailingAnchor	.constraint(equalTo: trailingAnchor, constant: -12),
			priceView.heightAnchor		.constraint(equalToConstant: 35),
			priceView.widthAnchor		.constraint(equalToConstant: 70)
		
		])
		
		NSLayoutConstraint.activate([
		
			ingredientsLabel.bottomAnchor.constraint(equalTo: priceView.bottomAnchor),
			ingredientsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
			ingredientsLabel.trailingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: -50)
		
		])
		
		NSLayoutConstraint.activate([

			pizzaNameLabel.bottomAnchor.constraint(equalTo: ingredientsLabel.topAnchor, constant: -5),
			pizzaNameLabel.leadingAnchor.constraint(equalTo: ingredientsLabel.leadingAnchor)

		])
        
    }
    
}
