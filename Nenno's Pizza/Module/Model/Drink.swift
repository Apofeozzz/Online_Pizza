//
//  Drink.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

struct Drink: Decodable, OrderProtocol {
    
    var id:     UInt
    
    var name:   String
    
    var price:  Double?
    
}
