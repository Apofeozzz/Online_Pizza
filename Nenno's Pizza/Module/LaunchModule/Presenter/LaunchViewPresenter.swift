//
//  LaunchViewPresenter.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/24/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit

protocol LaunchViewProtocol: class {
    
}

protocol LaunchViewPresenterProtocol: class {
    
    var view: LaunchViewProtocol? { get set }
    
    init(view: LaunchViewProtocol)
    
    func addButtonAction()
    
    func addCartAction()
    
}

class LaunchViewPresenter: LaunchViewPresenterProtocol {
    
    weak var view: LaunchViewProtocol?
    
    required init(view: LaunchViewProtocol) {
        
        self.view = view
        
    }
    
    func addButtonAction() {
        
        print("Presenter add button action")
        
    }
    
    func addCartAction() {
        
        print("Presenter add cart action")
        
    }
    
}
