//
//  Pizza.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

struct Pizza: Decodable {
    
    var name:           String
    
    var ingredients:    [UInt]
    
    var imageUrl:       String?
    
}

struct Pizzas: Decodable {
    
    var pizzas: [Pizza]
    
    var basePrice: Double
    
}
