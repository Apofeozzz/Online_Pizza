//
//  NetworkManager.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 24.02.2020.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let session = URLSession.shared
    
    // MARK: - NETWORK REQUESTS -
	
	// MARK: - INGREDIENTS -
    
    func downloadIngredients(completion: @escaping (_ goods: [Ingredient]?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: "https://api.myjson.com/bins/ozt3z") else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
                return
                
            }
            
            if let data = data {
                
                do {
                    
                let goods = try JSONDecoder().decode(Array<Ingredient>.self, from: data)
                
                    completion(goods, nil)
                    
                } catch { completion(nil, error) }
                
            }
            
        }.resume()
        
    }
    
    // MARK: - DRINKS -
    
    func downloadDrinks(completion: @escaping (_ drinks: [Drink]?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: "https://api.myjson.com/bins/150da7") else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
                return
                
            }
            
            if let data = data {
                
                do {
                    
                let drinks = try JSONDecoder().decode(Array<Drink>.self, from: data)
                
                    completion(drinks, nil)
                    
                } catch { completion(nil, error) }
                
            }
            
        }.resume()
        
    }
	
	// MARK: - PIZZAS -
    
    func downloadPizzas(completion: @escaping (_ pizzas: Pizzas?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: "https://api.myjson.com/bins/dokm7") else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
                return
                
            }
            
			if let data = data {
				
				do {
					
					let pizzas = try JSONDecoder().decode(Pizzas.self, from: data)
					
					completion(pizzas, nil)
					
				} catch { completion(nil, error) }
				
			}
            
		}.resume()
        
    }
    
}
