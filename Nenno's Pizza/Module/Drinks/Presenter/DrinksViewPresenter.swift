//
//  DrinksViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/27/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol DrinksViewProtocol: class {
	
}

protocol DrinksViewPresenterProtocol {
	
	var view: DrinksViewProtocol? { set get }
	
	var cart: Cart { set get }
	
	init(view: DrinksViewProtocol, cart: Cart)
	
}

class DrinksViewPresenter: DrinksViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: DrinksViewProtocol?
	
	var cart: Cart
	
	// MARK: - INIT -
	
	required init(view: DrinksViewProtocol, cart: Cart) {
		
		self.view = view
		
		self.cart = cart
		
	}
	
	// MARK: - ACTIONS -
	
	
	
}
