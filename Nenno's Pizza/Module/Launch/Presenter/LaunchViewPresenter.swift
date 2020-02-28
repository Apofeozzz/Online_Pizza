//
//  LaunchViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol LaunchViewProtocol: class {
	
	func moveToMenuController()
	
}

protocol LaunchViewPresenterProtocol {
	
	var view: 				LaunchViewProtocol? { set get }
	
	var networkManager: 	NetworkManager? { set get }
	
	var coreDataManager: 	CoreDataManager { set get }
	
	init(view: 				LaunchViewProtocol,
		 network: 			NetworkManager,
		 coreDataManager: 	CoreDataManager,
		 cart: 				Cart)
	
	func downloadStaff()
	
	func fetchCartData()
	
}

class LaunchViewPresenter: LaunchViewPresenterProtocol {
	
	weak var view: 			LaunchViewProtocol?
	
	var networkManager: 	NetworkManager?
	
	var coreDataManager: 	CoreDataManager
	
	var cart: 				Cart
	
	required init(view: 			LaunchViewProtocol,
				  network: 			NetworkManager,
				  coreDataManager: 	CoreDataManager,
				  cart: 			Cart) {
		
		self.view 				= view
		
		self.networkManager 	= network
		
		self.coreDataManager 	= coreDataManager
		
		self.cart 				= cart
		
	}
	
	func downloadStaff() {
		
		networkManager?.downloadGoods(completion: { [weak self] (goods, error) in
			
			guard let ss = self else { return }
			
			if error != nil {
				
				print(error!.localizedDescription)
				
				return
				
			}
			
			guard let goods = goods else { fatalError("No goods!") }
			
			GoodsList.shared.goods = goods
			
			ss.view?.moveToMenuController()
			
		})
		
	}
	
	func fetchCartData() {
		
		coreDataManager.fetchOrderInBackgroundContext { [weak self] (orders) in
			
			guard let ss = self else { return }
			
			for order in orders {
				
				guard let order = ss.coreDataManager
					.persistentContainer
					.viewContext
					.object(with: order.objectID) as? Order else { continue }
				
				let item = Drink(id: 0, name: order.name!, price: order.price)
				
				ss.cart.stuff.append(item)
				
			}
			
		}
		
	}
	
}
