//
//  DrinksViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/27/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol DrinksViewProtocol: class {
	
	var mainView: DrinksView! { get set }
	
	func reloadTableView()
	
	func addedToCartAction()
	
}

protocol DrinksViewPresenterProtocol {
	
	var view: DrinksViewProtocol? { set get }
	
	var cart: Cart { set get }
	
	var drinksList: DrinksList { set get }
	
	init(view: DrinksViewProtocol,
		 cart: Cart,
		 networkManager: NetworkManager,
		 drinksList: DrinksList)
	
	func downloadDrinks()
	
	func plusButtonAction(index: Int)
	
}

class DrinksViewPresenter: DrinksViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: DrinksViewProtocol?
	
	var networkManager: NetworkManager
	
	var cart: Cart
	
	var drinksList: DrinksList
	
	// MARK: - INIT -
	
	required init(view: DrinksViewProtocol,
				  cart: Cart,
				  networkManager: NetworkManager,
				  drinksList: DrinksList) {
		
		self.view = view
		
		self.cart = cart
		
		self.networkManager = networkManager
		
		self.drinksList = drinksList
		
	}
	
	// MARK: - ACTIONS -
	
	func downloadDrinks() {
		
		networkManager.downloadDrinks { [weak self] (stuff, error) in
			
			guard let ss = self else { return }
			
			if error != nil {
				
				print(error!.localizedDescription)
				
				return
				
			}
			
			guard let stuff = stuff else { return }
			
			ss.drinksList.drinks = stuff
			
			ss.view?.reloadTableView()
			
		}
		
	}
	
	func plusButtonAction(index: Int) {
		
		cart.appendStuff(good: drinksList.drinks[index])
			
		view?.addedToCartAction()

	}
	
}
