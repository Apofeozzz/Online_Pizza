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
	
}
