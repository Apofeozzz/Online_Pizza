//
//  LaunchViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

// MARK: - VIEW PROTOCOL -

protocol MenuViewProtocol: class {
	
	func reload()
	
	func navigateToNext(controller: UIViewController)
	
}

// MARK: - PRESENTER PROTOCOL -

protocol MenuViewPresenterProtocol: class {
	
	var view: MenuViewProtocol? { get set }
	
	var networkManager: NetworkManager? { get set }
	
	var pizzas: Pizzas? { set get }
	
	init(view: MenuViewProtocol, networkManager: NetworkManager)
	
	func drinksButtonAction()
	
	func cartAction()
	
	func selectPizza(index: Int)
	
}

// MARK: - PRESENTER -

class MenuViewPresenter: MenuViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: MenuViewProtocol?
	
	var networkManager: NetworkManager?
	
	var pizzas: Pizzas?
	
	// MARK: - INIT -
	
	required init(view: MenuViewProtocol, networkManager: NetworkManager) {
		
		self.view = view
		
		self.networkManager = networkManager
		
		downloadPizzas()
		
	}
	
	// MARK: - ACTIONS -
	
	func drinksButtonAction() {
		
		let drinksVC = Builder.drinksScreen()
		
		view?.navigateToNext(controller: drinksVC)
		
	}
	
	func cartAction() {
		
		let cartVC = Builder.cartScreen()
		
		view?.navigateToNext(controller: cartVC)
		
	}
	
	func selectPizza(index: Int) {
		
		let basePrice 	= pizzas?.basePrice
		
		let pizza 		= pizzas?.pizzas[index]
		
		let vc 			= Builder.ingredientsScreen(pizza: pizza,
													basePrice: basePrice)
		
		view?.navigateToNext(controller: vc)
		
	}
	
	// MARK: - GET DATA -
	
	func downloadPizzas() {
		
		networkManager?.downloadPizzas(completion: { [weak self] (pizzas, error) in
			
			guard let ss = self else { return }
			
			if error != nil {
				
				print(error!.localizedDescription)
				
				return
				
			}
			
			if let pizzas = pizzas {
				
				ss.pizzas = pizzas
				
				ss.view?.reload()
				
			}
			
		})
		
	}
	
}
