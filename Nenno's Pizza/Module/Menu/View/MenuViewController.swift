//
//  ViewController.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, MenuViewProtocol {
    
    // MARK: - PRESENTER -
    
    var presenter: MenuViewPresenterProtocol!
    
    // MARK: - UIVIEW -
    
    var mainView: MenuView!
    
    // MARK: - LIFE CYCLE -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    // MARK: - NAV BAR ACTIONS -
    
    @objc private func addButtonAction() {
        
        presenter.addButtonAction()
        
    }
    
    @objc private func addCartButtonAction() {
        
        presenter.addCartAction()
        
    }
	
	func reload() {
		
		DispatchQueue.main.async { [weak self] in
			
			guard let ss = self else { return }
			
			ss.mainView.pizzaTableView.reloadData()
			
		}

	}
    
    // MARK:- SETUP NAVIGATION BAR -
    
    private func setupNavigationBar() {
        
		navigationController?.navigationBar.tintColor = .naviRed
        
		let attributes = [NSAttributedString.Key.foregroundColor: UIColor.naviRed,
                          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        navigationItem.title = "NENNO'S PIZZA"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_cart_navbar"), style: .plain, target: self, action: #selector(addCartButtonAction))
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        
        setupMainView()
        
        setupConstraints()
        
    }
    
    private func setupMainView() {
        
        mainView = MenuView()
		
		mainView.pizzaTableView.dataSource 	= self
		
		mainView.pizzaTableView.delegate	= self
        
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

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
		guard let pizzas = presenter.pizzas?.pizzas else { return 0 }
		
		return pizzas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PizzaTableViewCell.cellId, for: indexPath) as! PizzaTableViewCell
        
		if let pizzas = presenter.pizzas {
			
			let pizza 		= pizzas.pizzas[indexPath.row]
			
			cell.basePrice 	= pizzas.basePrice
			
			cell.pizza 		= pizza
			
		}
		
        return cell
        
    }
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		print(indexPath.row)
		
	}
    
}
