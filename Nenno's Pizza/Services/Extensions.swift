//
//  Extensions.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

extension UIColor {
	
	static var naviRed: UIColor {
		
		UIColor.rgb(red: 225, green: 77, blue: 69)
		
	}
	
	static var primaryTextColor: UIColor {
		
		UIColor.rgb(red: 74, green: 74, blue: 74)
		
	}
	
	static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
		
		return UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
		
	}
	
}

extension String {
	
	var formatPrice: String {
		
		var price = self
		
		if self.suffix(2) == ".0" {
			
			price.removeLast()
			price.removeLast()
			
		}
		
		return price
		
	}
	
}
