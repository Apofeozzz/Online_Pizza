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
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		setupNavigationBar()
		
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
