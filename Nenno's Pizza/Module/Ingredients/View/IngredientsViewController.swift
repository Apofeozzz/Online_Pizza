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
		
	}
	
	// MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        setupMainView()
        
        setupConstraints()
        
    }
    
    private func setupMainView() {
        
        mainView = IngredientsView()
        
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
