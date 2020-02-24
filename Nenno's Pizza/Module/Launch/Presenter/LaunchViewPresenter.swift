//
//  LaunchViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol LaunchViewProtocol: class {
	
	func reload()
	
}

protocol LaunchViewPresenterProtocol: class {
	
	var view: LaunchViewProtocol? { get set }
	
	var networkManager: NetworkManager? { get set }
	
	var pizzas: Pizzas? { set get }
	
	init(view: LaunchViewProtocol, networkManager: NetworkManager)
	
	func addButtonAction()
	
	func addCartAction()
	
}

class LaunchViewPresenter: LaunchViewPresenterProtocol {
	
	weak var view: LaunchViewProtocol?
	
	var networkManager: NetworkManager?
	
	var pizzas: Pizzas?
	
	required init(view: LaunchViewProtocol, networkManager: NetworkManager) {
		
		self.view = view
		
		self.networkManager = networkManager
		
		downloadPizzas()
		
	}
	
	func addButtonAction() {
		
		print("Presenter add button action")
		
	}
	
	func addCartAction() {
		
		print("Presenter add cart action")
		
	}
	
	func downloadPizzas() {
		
		networkManager?.downloadPizzas(completion: { [weak self] (pizzas, error) in
			
			guard let ss = self else { return }
			
			if error != nil {
				
				print(error!.localizedDescription)
				
				return
				
			}
			
			if let pizzas = pizzas {
				
				ss.pizzas = pizzas
				
				ss.view?.reload()
				
			}
			
		})
		
	}
	
}
