//
//  Builder.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

// MARK: - PROTOCOL -

protocol BuilderProtocol: class {
	
	static func launchScreen() -> LaunchViewController
    
    static func menuScreen() -> MenuViewController
	
	static func ingredientsScreen(pizza: Pizza?, basePrice: Double?) -> IngredientsViewController
	
	static func drinksScreen() -> DrinksViewController
    
	static func cartScreen() -> CartViewController
	
	static func checkoutScreen() -> CheckoutViewController
	
}

// MARK: - BUILDER -

class Builder: BuilderProtocol {
	
	// MARK: - MODULES -
	
	// MARK: - LAUNCH -
	
	static func launchScreen() -> LaunchViewController {
		
		let launchVC 		= LaunchViewController()
		
		let networkManager 	= NetworkManager.shared
		
		let coreDataManager = CoreDataManager.shared
		
		let presenter = LaunchViewPresenter(view: 				launchVC,
											network: 			networkManager,
											coreDataManager: 	coreDataManager)
		
		launchVC.presenter = presenter
		
		return launchVC
		
	}

	// MARK: - MENU -
	
    static func menuScreen() -> MenuViewController {
        
        let menuVC 			= MenuViewController()
		
		let networkManager 	= NetworkManager.shared
        
		let presenter 		= MenuViewPresenter(view: menuVC,
												networkManager: networkManager)
        
        menuVC.presenter 	= presenter
        
        return menuVC
        
    }
	
	// MARK: - INGREDIENT -
	
	static func ingredientsScreen(pizza: Pizza?, basePrice: Double?) -> IngredientsViewController {
		
		let ingredientsVC 	= IngredientsViewController()
		
		let goods 			= IngredientsList.shared.goods
		
		let presenter = IngredientsViewPresenter(view: 				ingredientsVC,
												 pizza: 			pizza,
												 basePrice: 		basePrice,
												 ingredients:		goods,
												 cart: 				Cart.shared)
		
		ingredientsVC.presenter = presenter
		
		return ingredientsVC;
		
	}
	
	// MARK: - DRINK -
	
	static func drinksScreen() -> DrinksViewController {
		
		let drinksVC 		= DrinksViewController()
		
		let cart 			= Cart.shared
		
		let networkManager  = NetworkManager.shared
		
		let drinksList      = DrinksList.shared
		
		let presenter 		= DrinksViewPresenter(view: 			drinksVC,
													cart: 			cart,
													networkManager: networkManager,
													drinksList: 	drinksList)
		
		drinksVC.presenter 	= presenter
		
		return drinksVC
		
	}
	
	// MARK: - CART -
    
	static func cartScreen() -> CartViewController {
		
		let cart 			= Cart.shared
		
		let cartVC 			= CartViewController()
		
		let networkManager 	= NetworkManager.shared
		
		let presenter = CartViewPresenter(view: 			cartVC,
										  cart: 			cart,
										  networkManager: 	networkManager)
		
		cartVC.presenter = presenter
		
		return cartVC
		
	}
	
	// MARK: - CHECKOUT -
	
	static func checkoutScreen() -> CheckoutViewController {
		
		let cart = Cart.shared
		
		let checkoutVC = CheckoutViewController()
		
		let presenter = CheckoutViewPresenter(view: checkoutVC, cart: cart)
		
		checkoutVC.presenter = presenter
		
		return checkoutVC
		
	}
	
}
