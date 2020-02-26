//
//  CheckoutPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol CheckoutViewProtocol: class {
	
	func backToMenu(controller: UIViewController)
	
}

protocol CheckoutViewPresenterProtocol {
	
	var view: CheckoutViewProtocol? { get set }
	
	init(view: CheckoutViewProtocol, cart: Cart)
	
	func backToMenuController()
	
}

class CheckoutViewPresenter: CheckoutViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: CheckoutViewProtocol?
	
	var cart: Cart
	
	// MARK: - INIT -
	
	required init(view: CheckoutViewProtocol, cart: Cart) {
		
		self.view = view
		
		self.cart = cart
		
		self.cleanTheOrder()
		
	}
	
	// MARK: - ACTIONS -
	
	func cleanTheOrder() {
		
		cart.pizzas.removeAll()
		
	}
	
	func backToMenuController() {
		
		let menuVC = Builder.menuScreen()
		
		view?.backToMenu(controller: menuVC)
		
	}
	
}
