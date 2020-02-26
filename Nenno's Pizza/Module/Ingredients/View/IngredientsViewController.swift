//
//  IngredientsViewController.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 25.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController, IngredientsViewProtocol {
	
	// MARK: - PRESENTER -
	
	var presenter: IngredientsViewPresenterProtocol?
	
	// MARK: - UIVIEW -
	
	var mainView: IngredientsView!
	
	// MARK: - LIFE CYCLE -
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
		presenter?.setupSubscriptions()
		
	}
	
	// MARK: - ACTION -
	
	@objc private func backButtonAction() {
		
		navigationController?.popViewController(animated: true)
		
	}
	
	func addedToCartAction() {
		
		navigationController?.setNavigationBarHidden(true, animated: true)
		
		mainView.whiteBackground.isHidden = false
		
		mainView.addedToCartLabelTopConstraint.constant = 0
		
		UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
			
			guard let ss = self else { return }
			
			ss.view.layoutIfNeeded()
			
		}) { (_) in
			
			Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { [weak self] (_) in
				
				guard let ss = self else { return }
				
				ss.navigationController?.popViewController(animated: true)
				
			}
			
		}
		
	}
	
	// MARK: - SETUP VIEW -
    
    private func setupView() {
		
		navigationController?.navigationBar.topItem?.title = " "
        
        view.backgroundColor = .white
		
		title = presenter?.pizza?.name.uppercased()
        
        setupMainView()
        
        setupConstraints()
        
    }
    
    private func setupMainView() {
        
        mainView = IngredientsView()
		
		if let urlString = presenter?.pizza?.imageUrl, let url = URL(string: urlString) {
		
			mainView.pizzaImageView.kf.setImage(with: url)
			
		}
		
		mainView.ingredientsTableView.dataSource 	= self
		
		mainView.ingredientsTableView.delegate 		= self
		
		mainView.setupCartButtonTitle(price: "\(presenter?.countPrice() ?? 0)".formatPrice)
        
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

// MARK: - UITABLEVIEW -

extension IngredientsViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return presenter?.ingredients.count ?? 0
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.id) as! IngredientsTableViewCell
		
		if let presenter = presenter, let pizza = presenter.pizza {
			
			let ingredient = presenter.ingredients[indexPath.row]
			
			cell.ingredient = ingredient
			
			if pizza.ingredients.contains(ingredient.id) {
				
				cell.wasSelected = true
				
			}
			
		}
		
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		let cell = tableView.cellForRow(at: indexPath) as! IngredientsTableViewCell
		
		if cell.wasSelected {
			
			if let good = presenter?.ingredients[indexPath.row] {
			
				presenter?.pizza?.removeIngredient(id: good.id)
				
			}
			
			cell.wasSelected = false
			
		}
		
		else {
			
			if let good = presenter?.ingredients[indexPath.row] {
			
				presenter?.pizza?.addIngredient(id: good.id)
				
			}
			
			cell.wasSelected = true
			
		}
		
		mainView.setupCartButtonTitle(price: "\(presenter?.countPrice() ?? 0)".formatPrice)
		
		tableView.reloadData()
		
	}
	
}
