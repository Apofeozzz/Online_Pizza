//
//  ViewController.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, LaunchViewProtocol {
    
    var presenter: LaunchViewPresenterProtocol!
    
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
    
    // MARK:- SETUP NAVIGATION BAR -
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.tintColor = .red
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.red,
                          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        navigationItem.title = "Nenno's Pizza"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_cart_navbar"), style: .plain, target: self, action: #selector(addCartButtonAction))
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        
        setupConstraints()
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            
        
        ])
        
    }


}

