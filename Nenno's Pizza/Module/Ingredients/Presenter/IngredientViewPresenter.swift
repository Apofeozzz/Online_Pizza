//
//  IngredientViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 25.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

protocol IngredientsViewProtocol: class {
	
}

protocol IngredientsViewPresenterProtocol {
	
	init(view: IngredientsViewProtocol, networkManager: NetworkManager)
	
}

class IngredientsViewPresenter: IngredientsViewPresenterProtocol {
	
	weak var view: IngredientsViewProtocol?
	
	var networkManager: NetworkManager
	
	required init(view: IngredientsViewProtocol, networkManager: NetworkManager) {
		
		self.view = view
		
		self.networkManager = networkManager
		
	}
	
}
