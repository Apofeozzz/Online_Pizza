//
//  Order+CoreDataClass.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/28/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Order)
public class Order: NSManagedObject {

	convenience init() {
		
		self.init(entity: CoreDataManager.shared.entityForName("Order"),
				  insertInto: CoreDataManager.shared.persistentContainer.viewContext)
		
	}
	
}
