//
//  IngredientViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 25.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - VIEW PROTOCOL -

protocol IngredientsViewProtocol: class {
	
	var mainView: IngredientsView! { set get }
	
	func addedToCartAction()
	
}

// MARK: - PRESENTER PROTOCOL -

protocol IngredientsViewPresenterProtocol {
	
	var ingredients: [Ingredient] { set get }
	
	var pizza: Pizza? { get set }
	
	var basePrice: Double? { get set }
	
	var cart: Cart { get set }
	
	init(view: IngredientsViewProtocol,
		 pizza: Pizza?,
		 basePrice: Double?,
		 ingredients: [Ingredient],
		 cart: Cart)
	
	func setupSubscriptions()
	
	func countPrice() -> Double
	
}

// MARK: - PRESENTER -

class IngredientsViewPresenter: IngredientsViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: IngredientsViewProtocol?
	
	var ingredients: [Ingredient]
	
	var pizza: Pizza?
	
	var basePrice: Double?
	
	var cart: Cart
	
	let disposeBag = DisposeBag()
	
	// MARK: - INIT -
	
	required init(view: IngredientsViewProtocol,
				  pizza: Pizza?,
				  basePrice: Double?,
				  ingredients: [Ingredient],
				  cart: Cart) {
		
		self.view 			= view
		
		self.pizza 			= pizza
		
		self.basePrice 		= basePrice
		
		self.ingredients	= ingredients
		
		self.cart			= cart
		
	}
	
	// MARK: - SETUP SUBSCRIPTIONS -
	
	func setupSubscriptions() {
		
		view?.mainView.addToCartButton.rx.controlEvent(.touchUpInside).subscribe(onNext: {[weak self] (_) in
			
			print("Add to cart button pressed!")
			
			guard let ss = self else { return }
			
			if ss.pizza != nil { ss.pizza!.price = ss.countPrice() }
			
			ss.cart.appendToOrder(good: ss.pizza!)
			
			ss.view?.addedToCartAction()
			
		}).disposed(by: disposeBag)
		
	}
	
	// MARK: - ACTIONS -
	
	func countPrice() -> Double {
		
		guard var price = basePrice, let pizza = pizza else { return 0 }
		
		for good in pizza.ingredients {
			
			for each in ingredients {
				
				if each.id == good {
					
					price += each.price
					
				}
				
			}
			
		}
		
		return price
		
	}
	
}
