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
    
}

class Builder: BuilderProtocol {

    static func launchScreen() -> LaunchViewController {
        
        let launchVC 		= LaunchViewController()
		
		let networkManager 	= NetworkManager.shared
        
		let presenter 		= LaunchViewPresenter(view: launchVC,
											networkManager: networkManager)
        
        launchVC.presenter 	= presenter
        
        return launchVC
        
    }
    
    
}
