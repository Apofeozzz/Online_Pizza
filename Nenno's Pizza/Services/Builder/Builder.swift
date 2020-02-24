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
    
    
}
