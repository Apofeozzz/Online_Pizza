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
		
		let networkManager 	= NetworkManager.shared
		
		let goods 			= GoodsList.shared.goods
		
		let presenter = IngredientsViewPresenter(view: 				ingredientsVC,
												 networkManager: 	networkManager,
												 pizza: 			pizza,
												 basePrice: 		basePrice,
												 ingredients:		goods,
												 cart: 				Cart.shared)
		
		ingredientsVC.presenter = presenter
		
		return ingredientsVC;
		
	}
    
}
