//
//  Pizza.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

struct Pizza: Decodable, OrderProtocol {
    
    var name:           String
    
    var ingredients:    [UInt]
    
    var imageUrl:       String?
	
	var price:			Double?
	
	mutating func addIngredient(id: UInt) {
		
		ingredients.append(id)
		
	}
	
	mutating func removeIngredient(id: UInt) {
		
		guard let index = ingredients.firstIndex(of: id) else { return }
		
		ingredients.remove(at: index)
		
	}
    
}

struct Pizzas: Decodable {
    
    var pizzas: [Pizza]
    
    var basePrice: Double
    
}
