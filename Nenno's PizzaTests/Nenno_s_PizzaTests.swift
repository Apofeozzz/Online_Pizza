//
//  Nenno_s_PizzaTests.swift
//  Nenno's PizzaTests
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import XCTest
@testable import Nenno_s_Pizza

class Nenno_s_PizzaTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testCartCountTotal() {
		
		let cart = Cart.shared
		
		let cartPresenter = CartViewPresenter(view: CartViewController(), cart: cart, networkManager: NetworkManager.shared)
		
		let pizzasTestArray = [Pizza(name: "Test 1", ingredients: [], imageUrl: nil, price: 6.2),
							   Pizza(name: "Test 2", ingredients: [], imageUrl: nil, price: 8.5)]
		
		cart.order = pizzasTestArray
		
		let total = cartPresenter.countTotal()
		
		XCTAssertEqual(total, 14.7, "Total count is not correct")
		
	}

}
