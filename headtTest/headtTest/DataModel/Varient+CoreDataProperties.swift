//
//  Varient+CoreDataProperties.swift
//  headtTest
//
//  Created by Jay Kumar on 7/13/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension Varient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Varient> {
        return NSFetchRequest<Varient>(entityName: "Varient")
    }

    @NSManaged public var size: Int32
    @NSManaged public var id: Int32
    @NSManaged public var color: String?
    @NSManaged public var price: Float
    @NSManaged public var product: Product?

}
