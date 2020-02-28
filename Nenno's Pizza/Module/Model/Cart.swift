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
	
	var order = [OrderProtocol]()
	
	func appendToOrder(good: OrderProtocol) {
		
		order.append(good)
		
		CoreDataManager.shared.addToOrder(good)
		
	}
	
	func deleteInOrder(at index: Int) {
		
		let good = order[index]
		
		order.remove(at: index)
		
		CoreDataManager.shared.deleteOrder(good)
		
	}
	
	func cleanCart() {
		
		order.removeAll()
		
		CoreDataManager.shared.cleanCoreData()
		
	}
	
}
