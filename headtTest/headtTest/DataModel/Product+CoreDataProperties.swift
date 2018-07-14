//
//  Product+CoreDataProperties.swift
//  headtTest
//
//  Created by Jay Kumar on 7/13/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var date_addes: String?
    @NSManaged public var category: Category?
    @NSManaged public var varient: NSSet?

}

// MARK: Generated accessors for varient
extension Product {

    @objc(addVarientObject:)
    @NSManaged public func addToVarient(_ value: Varient)

    @objc(removeVarientObject:)
    @NSManaged public func removeFromVarient(_ value: Varient)

    @objc(addVarient:)
    @NSManaged public func addToVarient(_ values: NSSet)

    @objc(removeVarient:)
    @NSManaged public func removeFromVarient(_ values: NSSet)

}
