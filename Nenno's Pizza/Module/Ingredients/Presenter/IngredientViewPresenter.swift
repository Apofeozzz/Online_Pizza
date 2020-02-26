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
	
}

// MARK: - PRESENTER PROTOCOL -

protocol IngredientsViewPresenterProtocol {
	
	var ingredients: [Good] { set get }
	
	var pizza: Pizza? { get set }
	
	var basePrice: Double? { get set }
	
	var cart: Cart? { get set }
	
	init(view: IngredientsViewProtocol,
		 networkManager: NetworkManager,
		 pizza: Pizza?,
		 basePrice: Double?,
		 ingredients: [Good],
		 cart: Cart?)
	
	func setupSubscriptions()
	
	func countPrice() -> Double
	
}

// MARK: - PRESENTER -

class IngredientsViewPresenter: IngredientsViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: IngredientsViewProtocol?
	
	var networkManager: NetworkManager
	
	var ingredients: [Good]
	
	var pizza: Pizza?
	
	var basePrice: Double?
	
	var cart: Cart?
	
	let disposeBag = DisposeBag()
	
	// MARK: - INIT -
	
	required init(view: IngredientsViewProtocol,
				  networkManager: NetworkManager,
				  pizza: Pizza?,
				  basePrice: Double?,
				  ingredients: [Good],
				  cart: Cart?) {
		
		self.view 			= view
		
		self.networkManager = networkManager
		
		self.pizza 			= pizza
		
		self.basePrice 		= basePrice
		
		self.ingredients	= ingredients
		
		self.cart			= cart
		
	}
	
	func setupSubscriptions() {
		
		view?.mainView.addToCartButton.rx.controlEvent(.touchUpInside).subscribe(onNext: {[weak self] (_) in
			
			print("Add to cart button pressed!")
			
			guard let ss = self else { return }
			
			if ss.pizza != nil { ss.pizza!.totalPrice = ss.countPrice() }
			
			ss.cart?.pizzas.append(ss.pizza!)
			
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
