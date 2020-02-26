//
//  CartViewController.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, CartViewProtocol {
	
	// MARK: - PRESENTER -
	
	var presenter: CartViewPresenterProtocol!
	
	// MARK: - UI VIEW -
	
	var mainView: CartView!
	
	// MARK: - LIFE CYCLE -
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
		presenter.setupSubscriptions()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		checkTheOrder()
		
	}
	
	// MARK: - NAVIGATION -
	
	func navigateTo(controller: UIViewController) {
		
		navigationController?.pushViewController(controller, animated: true)
		
	}
	
	// MARK: - ACTION -
	
	func reloadTableView() {
		
		DispatchQueue.main.async { [weak self] in
			
			guard let ss = self else { return }
			
			ss.mainView.cartTableView.reloadData()
			
			ss.checkTheOrder()
			
		}
		
	}
	
	func checkTheOrder() {
		
		if presenter.cart.pizzas.isEmpty {
			
			mainView.checkoutButton.backgroundColor = .lightGray
			
			mainView.checkoutButton.isUserInteractionEnabled = false
			
		}
		
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupNavigationBar() {
		
		navigationController?.navigationBar.topItem?.title = " "
		
		title = "CART"
		
	}
    
    private func setupView() {
		
		setupNavigationBar()
        
        view.backgroundColor = .white
        
        setupMainView()
        
        setupConstraints()
        
    }
	
	private func setupMainView() {
        
        mainView = CartView()
        
		mainView.cartTableView.dataSource = self
		
		mainView.cartTableView.delegate = self
		
        view.addSubview(mainView)
        
    }
	
	// MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            mainView.topAnchor      .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor  .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor   .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return presenter.cart.pizzas.count + 1
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row < presenter.cart.pizzas.count {
			
			let cell = tableView.dequeueReusableCell(withIdentifier: CartViewTableViewCell.id) as! CartViewTableViewCell
			
			let pizza = presenter.cart.pizzas[indexPath.row]
			
			cell.itemNameLabel.text = pizza.name
			
			cell.priceLabel.text 	= "$\(pizza.totalPrice ?? 0)".formatPrice
			
			cell.delete = {[weak self] in
				
				guard  let ss = self else { return }
				
				ss.presenter.deleteAction(index: indexPath.row)
				
			}
			
			return cell
			
		} else {
			
			let cell = CartTotalTableViewCell()
			
			cell.priceLabel.text = "$\(presenter.countTotal())".formatPrice
			
			return cell
			
		}
		
	}
	
}
