//
//  CartViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - VIEW PROTOCOL -

protocol CartViewProtocol: class {
	
	var mainView: CartView! { get set }
	
	func reloadTableView()
	
	func navigateTo(controller: UIViewController)
	
}

// MARK: - PRESENTER PROTOCOL -

protocol CartViewPresenterProtocol {
	
	var view: CartViewProtocol? { get set }
	
	var cart: Cart { get set }
	
	init(view: CartViewProtocol, cart: Cart, networkManager: NetworkManager)
	
	func setupSubscriptions()
	
	func countTotal() -> Double
	
	func deleteAction(index: Int)
	
}

// MARK: - PRESENTER -

class CartViewPresenter: CartViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: CartViewProtocol?
	
	var cart: Cart
	
	let disposeBag = DisposeBag()
	
	// MARK: - INIT -
	
	required init(view: CartViewProtocol, cart: Cart, networkManager: NetworkManager) {
		
		self.view = view
		
		self.cart = cart
		
	}
	
	// MARK: - SETUP SUBSCRIPTIONS -
	
	func setupSubscriptions() {
		
		view?.mainView.checkoutButton.rx.controlEvent(.touchUpInside).subscribe(onNext: {[weak self] (_) in
			
			guard let ss = self else { return }
			
			ss.checkoutButtonAction()
			
		}).disposed(by: disposeBag)
		
	}
	
	// MARK: - ACTIONS -
	
	func countTotal() -> Double {
		
		var total: Double = 0
		
		for pizza in cart.order {
		
			total += pizza.price ?? 0
			
		}
		
		return total
		
	}
	
	private func checkoutButtonAction() {
		
		cart.cleanCart()
		
		let checkoutVC = Builder.checkoutScreen()
		
		view?.navigateTo(controller: checkoutVC)
		
	}
	
	func deleteAction(index: Int) {
		 
		cart.deleteInOrder(at: index)
		
		view?.reloadTableView()
		
	}
	
}
