//
//  Cart.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/26/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

class Cart {
	
	static let shared = Cart()
	
	var stuff = [OrderProtocol]()
	
	func appendStuff(good: OrderProtocol) {
		
		stuff.append(good)
		
		let order 	= Order()
		
		order.name 	= good.name
		
		order.price = good.price!
		
		CoreDataManager.shared.saveContext()
		
	}
	
	func deleteStuff(at index: Int) {
		
		let good = stuff[index]
		
		stuff.remove(at: index)
		
		CoreDataManager.shared.deleteOrder(good)
		
	}
	
	func cleanCart() {
		
		stuff.removeAll()
		
		CoreDataManager.shared.cleanCoreData()
		
	}
	
}
