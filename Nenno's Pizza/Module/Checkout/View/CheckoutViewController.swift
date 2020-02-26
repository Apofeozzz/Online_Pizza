//
//  CheckoutViewController.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 26.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, CheckoutViewProtocol {
	
	// MARK: - PRESENTER -
	
	var presenter: CheckoutViewPresenterProtocol!
	
	// MARK: - UIVIEW -
	
	var mainView: CheckoutView!
	
	// MARK: - LIFE CYCLE -
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
		setupNavigationBar()
		
		Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {[weak self] (_) in
			
			guard let ss = self else { return }
			
			ss.presenter.backToMenuController()
			
		}
		
	}
	
	// MARK: - ACTIONS -
	
	func backToMenu(controller: UIViewController) {
		
		navigationController?.viewControllers = [controller]
		
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupNavigationBar() {
		
		navigationController?.setNavigationBarHidden(true, animated: false)
		
	}
	
	private func setupView() {
		
		view.backgroundColor = .white
		
		setupMainView()
		
		setupConstraints()
		
	}
	
	private func setupMainView() {
		
		mainView = CheckoutView()
		
		view.addSubview(mainView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			mainView.topAnchor		.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			mainView.leadingAnchor	.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			mainView.trailingAnchor	.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			mainView.bottomAnchor	.constraint(equalTo: view.bottomAnchor)
		
		])
		
	}
	
}
