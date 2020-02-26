//
//  CartViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

// MARK: - VIEW PROTOCOL -

protocol CartViewProtocol: class {
	
}

// MARK: - PRESENTER PROTOCOL -

protocol CartViewPresenterProtocol {
	
	var view: CartViewProtocol? { get set }
	
	var cart: Cart { get set }
	
	init(view: CartViewProtocol, cart: Cart, networkManager: NetworkManager)
	
	func countTotal() -> Double
	
}

// MARK: - PRESENTER -

class CartViewPresenter: CartViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: CartViewProtocol?
	
	var cart: Cart
	
	// MARK: - INIT -
	
	required init(view: CartViewProtocol, cart: Cart, networkManager: NetworkManager) {
		
		self.view = view
		
		self.cart = cart
		
	}
	
	// MARK: - ACTIONS -
	
	func countTotal() -> Double {
		
		var total: Double = 0
		
		for pizza in cart.pizzas {
		
			total += pizza.totalPrice ?? 0
			
		}
		
		return total
		
	}
	
}
