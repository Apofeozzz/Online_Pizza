//
//  IngredientViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 25.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

// MARK: - VIEW PROTOCOL -

protocol IngredientsViewProtocol: class {
	
}

// MARK: - PRESENTER PROTOCOL -

protocol IngredientsViewPresenterProtocol {
	
	var ingredients: [Good] { set get }
	
	var pizza: Pizza? { get set }
	
	var basePrice: Double? { get set }
	
	init(view: IngredientsViewProtocol,
		 networkManager: NetworkManager,
		 pizza: Pizza?,
		 basePrice: Double?,
		 ingredients: [Good])
	
	func countPrice() -> String
	
}

// MARK: - PRESENTER -

class IngredientsViewPresenter: IngredientsViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: IngredientsViewProtocol?
	
	var networkManager: NetworkManager
	
	var ingredients: [Good]
	
	var pizza: Pizza?
	
	var basePrice: Double?
	
	// MARK: - INIT -
	
	required init(view: IngredientsViewProtocol,
				  networkManager: NetworkManager,
				  pizza: Pizza?,
				  basePrice: Double?,
				  ingredients: [Good]) {
		
		self.view 			= view
		
		self.networkManager = networkManager
		
		self.pizza 			= pizza
		
		self.basePrice 		= basePrice
		
		self.ingredients	= ingredients
		
	}
	
	// MARK: - ACTIONS -
	
	func countPrice() -> String {
		
		guard var price = basePrice, let pizza = pizza else { return "" }
		
		for good in pizza.ingredients {
			
			for each in ingredients {
				
				if each.id == good {
					
					price += each.price
					
				}
				
			}
			
		}
		
		return "\(price)".formatPrice
		
	}
	
}
