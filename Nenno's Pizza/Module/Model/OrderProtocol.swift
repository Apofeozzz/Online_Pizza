//
//  OrderProtocol.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 27.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

protocol OrderProtocol {
	
	var name: String { get set }
	
	var price: Double? { get set }
	
}
