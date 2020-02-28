//
//  Order+CoreDataProperties.swift
//  Nenno's Pizza
//
//  Created by Denis Grishchenko on 2/28/20.
//  Copyright © 2020 DenisGrishchenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double

}
