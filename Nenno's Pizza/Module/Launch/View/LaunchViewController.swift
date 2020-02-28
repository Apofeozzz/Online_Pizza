//
//  LaunchViewController.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, LaunchViewProtocol {
	
	// MARK: - PRESENTER -
	
	var presenter: LaunchViewPresenterProtocol?
	
	// MARK: - UIVIEW -
	
	var mainView: LaunchView!
	
	// MARK: - LIFE CYCLE -
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
		presenter?.downloadStaff()
		
		presenter?.fetchCartData()
		
	}
	
	// MARK: - NAVIGATION -
	
	func moveToMenuController() {
		
		DispatchQueue.main.async { [weak self] in
			
			guard let ss = self else { return }
			
			ss.navigationController?.viewControllers = [Builder.menuScreen()]
			
		}
		
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		navigationController?.isNavigationBarHidden = true
		
		view.backgroundColor = .white
		
		setupMainView()
		
		setupConstraints()
		
	}
	
	// MARK: - SETUP MAIN VIEW -
	
	private func setupMainView() {
		
		mainView = LaunchView()
		
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
