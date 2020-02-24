//
//  GoodsList.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

class GoodsList {
	
	static let shared = GoodsList()
	
	var goods = [Good]()
	
	init() {
		
		NetworkManager.shared.downloadGoods { (goods, error) in
			
			if error != nil {
				
				print(error!.localizedDescription)
				
				return
				
			}
			
			if let goods = goods { self.goods = goods }
			
		}
		
	}
	
	
	
}
