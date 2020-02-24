//
//  LaunchViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol LaunchViewProtocol: class {
	
	func moveToMenuController()
	
}

protocol LaunchViewPresenterProtocol {
	
	var view: LaunchViewProtocol? { set get }
	
	var networkManager: NetworkManager? { set get }
	
	init(view: LaunchViewProtocol, network: NetworkManager)
	
	func downloadStaff()
	
}

class LaunchViewPresenter: LaunchViewPresenterProtocol {
	
	weak var view: LaunchViewProtocol?
	
	var networkManager: NetworkManager?
	
	required init(view: LaunchViewProtocol, network: NetworkManager) {
		
		self.view = view
		
		self.networkManager = network
		
	}
	
	func downloadStaff() {
		
		networkManager?.downloadGoods(completion: { [weak self] (goods, error) in
			
			guard let ss = self else { return }
			
			if error != nil {
				
				print(error!.localizedDescription)
				
				return
				
			}
			
			guard let goods = goods else { fatalError("No goods!") }
			
			GoodsList.shared.goods = goods
			
			ss.view?.moveToMenuController()
			
		})
		
	}
	
}
