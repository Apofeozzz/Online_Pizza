//
//  CoreDataManager.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/28/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
	
	static let shared = CoreDataManager()
	
	// MARK: - ENTITY DESCRIPTION -
	
	func entityForName(_ entityName: String) -> NSEntityDescription {
		
		guard let entity = NSEntityDescription.entity(forEntityName: "Order", in: persistentContainer.viewContext)
			
			else { fatalError("Can't create entity \(entityName)") }
		
		return entity
		
	}
	
	// MARK: - FETCH DATA -
	
	func fetchOrderInBackgroundContext(completion: @escaping (_ orders: [Order]) -> Void) {
		
		let backgroundContext = persistentContainer.newBackgroundContext()
		
		let fetchRequest = NSFetchRequest<Order>(entityName: "Order")
		
		let asyncFetchRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { (fetchResult) in
			
			guard let orders = fetchResult.finalResult else { return }
			
			completion(orders)

		}
		
		do {
			
			try backgroundContext.execute(asyncFetchRequest)
			
		} catch { print(error.localizedDescription) }
		
	}
	
	// MARK: - CLEAN -
	
	func deleteOrder(_ good: OrderProtocol) {
		
		fetchOrderInBackgroundContext { [weak self] (orders) in
			
			guard let ss = self else { return }
			
			for order in orders {
			
				guard let order = ss.persistentContainer
									.viewContext
									.object(with: order.objectID) as? Order else { continue }
				
				if order.name == good.name && order.price == good.price {

					ss.persistentContainer.viewContext.delete(order)
					
					ss.saveContext()
					
					return
					
				}
				
			}
			
		}
		
	}
	
	func cleanCoreData() {
		
		fetchOrderInBackgroundContext { [weak self] (orders) in
			
			guard let ss = self else { return }
			
			for order in orders {
				
				guard let order = ss.persistentContainer.viewContext.object(with: order.objectID) as? Order else { continue }
				
				ss.persistentContainer.viewContext.delete(order)
				
			}
			
			ss.saveContext()
			
		}
		
	}
	
	// MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Nenno_s_Pizza")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
	
}
