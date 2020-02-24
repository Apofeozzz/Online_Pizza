//
//  LaunchViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol MenuViewProtocol: class {
	
	func reload()
	
}

protocol MenuViewPresenterProtocol: class {
	
	var view: MenuViewProtocol? { get set }
	
	var networkManager: NetworkManager? { get set }
	
	var pizzas: Pizzas? { set get }
	
	init(view: MenuViewProtocol, networkManager: NetworkManager)
	
	func addButtonAction()
	
	func addCartAction()
	
}

class MenuViewPresenter: MenuViewPresenterProtocol {
	
	weak var view: MenuViewProtocol?
	
	var networkManager: NetworkManager?
	
	var pizzas: Pizzas?
	
	required init(view: MenuViewProtocol, networkManager: NetworkManager) {
		
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
