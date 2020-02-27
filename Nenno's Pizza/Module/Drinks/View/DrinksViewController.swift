//
//  DrinksViewController.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/27/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController, DrinksViewProtocol {
	
	// MARK: - PRESENTER -
	
	var presenter: DrinksViewPresenterProtocol!
	
	// MARK: - UIVIEW -
	
	var mainView: DrinksView!
	
	// MARK: - LIFE CYCLE -
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
		presenter.downloadDrinks()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		setupNavigationBar()
		
	}
	
	// MARK: - ACTIONS -
	
	func reloadTableView() {
		
		DispatchQueue.main.async { [weak self] in
			
			guard let ss = self else { return }
			
			ss.mainView.drinksTableView.reloadData()
			
		}
		
	}
	
	func addedToCartAction() {
		
		navigationController?.setNavigationBarHidden(true, animated: true)
		
		mainView.addedToCartLabelTopConstraint.constant = 0
		
		view.isUserInteractionEnabled = false
		
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
	
	private func setupNavigationBar() {
		
		navigationController?.navigationBar.topItem?.title = " "
		
		title = "DRINKS"
		
	}
	
	private func setupView() {
		
		view.backgroundColor = .white
		
		setupMainView()
		
		setupConstraints()
		
	}
	
	private func setupMainView() {
		
		mainView = DrinksView()
		
		mainView.drinksTableView.dataSource = self
		
		mainView.drinksTableView.delegate	= self
		
		view.addSubview(mainView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			mainView.topAnchor		.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			mainView.bottomAnchor	.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			mainView.leadingAnchor	.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			mainView.trailingAnchor	.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		
		])
		
	}
	
}

// MARK: - UITABLEVIEW DELEGATE -

extension DrinksViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return presenter.drinksList.drinks.count
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: DrinksTableViewCell.id) as! DrinksTableViewCell
		
		cell.drink = presenter.drinksList.drinks[indexPath.row]
		
		cell.plusAction = { [weak self] in
			
			guard let ss = self else { return }
			
			ss.presenter.plusButtonAction(index: indexPath.row)
			
		}
		
		return cell
		
	}
	
}
