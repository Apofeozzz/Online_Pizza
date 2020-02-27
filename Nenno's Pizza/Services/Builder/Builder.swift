//
//  Builder.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol BuilderProtocol: class {
	
	static func launchScreen() -> LaunchViewController
    
    static func menuScreen() -> MenuViewController
	
	static func ingredientsScreen(pizza: Pizza?, basePrice: Double?) -> IngredientsViewController
	
	static func drinksScreen() -> DrinksViewController
    
	static func cartScreen() -> CartViewController
	
	static func checkoutScreen() -> CheckoutViewController
	
}

class Builder: BuilderProtocol {
	
	static func launchScreen() -> LaunchViewController {
		
		let launchVC = LaunchViewController()
		
		let networkManager = NetworkManager.shared
		
		let presenter = LaunchViewPresenter(view: launchVC, network: networkManager)
		
		launchVC.presenter = presenter
		
		return launchVC
		
	}

    static func menuScreen() -> MenuViewController {
        
        let menuVC 			= MenuViewController()
		
		let networkManager 	= NetworkManager.shared
        
		let presenter 		= MenuViewPresenter(view: menuVC,
												networkManager: networkManager)
        
        menuVC.presenter 	= presenter
        
        return menuVC
        
    }
	
	static func ingredientsScreen(pizza: Pizza?, basePrice: Double?) -> IngredientsViewController {
		
		let ingredientsVC 	= IngredientsViewController()
		
		let goods 			= GoodsList.shared.goods
		
		let presenter = IngredientsViewPresenter(view: 				ingredientsVC,
												 pizza: 			pizza,
												 basePrice: 		basePrice,
												 ingredients:		goods,
												 cart: 				Cart.shared)
		
		ingredientsVC.presenter = presenter
		
		return ingredientsVC;
		
	}
	
	static func drinksScreen() -> DrinksViewController {
		
		let drinksVC 		= DrinksViewController()
		
		let cart 			= Cart.shared
		
		let networkManager  = NetworkManager.shared
		
		let drinksList      = DrinksList.shared
		
		let presenter 		= DrinksViewPresenter(view: drinksVC,
													cart: cart,
													networkManager: networkManager,
													drinksList: drinksList)
		
		drinksVC.presenter 	= presenter
		
		return drinksVC
		
	}
    
	static func cartScreen() -> CartViewController {
		
		let cart 			= Cart.shared
		
		let cartVC 			= CartViewController()
		
		let networkManager 	= NetworkManager.shared
		
		let presenter = CartViewPresenter(view: cartVC,
										  cart: cart,
										  networkManager: networkManager)
		
		cartVC.presenter = presenter
		
		return cartVC
		
	}
	
	static func checkoutScreen() -> CheckoutViewController {
		
		let cart = Cart.shared
		
		let checkoutVC = CheckoutViewController()
		
		let presenter = CheckoutViewPresenter(view: checkoutVC, cart: cart)
		
		checkoutVC.presenter = presenter
		
		return checkoutVC
		
	}
	
}
