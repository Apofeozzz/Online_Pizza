//
//  LaunchViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

// MARK: - VIEW PROTOCOL -

protocol LaunchViewProtocol: class {
	
	func moveToMenuController()
	
}

// MARK: - PRESENTER PROTOCOL -

protocol LaunchViewPresenterProtocol {
	
	var view: 				LaunchViewProtocol? { set get }
	
	var networkManager: 	NetworkManager? { set get }
	
	var coreDataManager: 	CoreDataManager { set get }
	
	init(view: 				LaunchViewProtocol,
		 network: 			NetworkManager,
		 coreDataManager: 	CoreDataManager)
	
	func downloadStaff()
	
	func fetchCartData()
	
}

// MARK: - PRESENTER -

class LaunchViewPresenter: LaunchViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: 			LaunchViewProtocol?
	
	var networkManager: 	NetworkManager?
	
	var coreDataManager: 	CoreDataManager
	
	// MARK: - INIT -
	
	required init(view: 			LaunchViewProtocol,
				  network: 			NetworkManager,
				  coreDataManager: 	CoreDataManager) {
		
		self.view 				= view
		
		self.networkManager 	= network
		
		self.coreDataManager 	= coreDataManager
		
	}
	
	// MARK: - GET DATA -
	
	func downloadStaff() {
		
		networkManager?.downloadIngredients(completion: { [weak self] (goods, error) in
			
			guard let ss = self else { return }
			
			if error != nil {
				
				print(error!.localizedDescription)
				
				return
				
			}
			
			guard let goods = goods else { fatalError("No goods!") }
			
			IngredientsList.shared.goods = goods
			
			ss.view?.moveToMenuController()
			
		})
		
	}
	
	func fetchCartData() {
		
		coreDataManager.fetchCartData()
		
	}
	
}
