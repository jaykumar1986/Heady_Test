//
//  RankingProd+CoreDataProperties.swift
//  headtTest
//
//  Created by Jay Kumar on 7/15/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension RankingProd {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RankingProd> {
        return NSFetchRequest<RankingProd>(entityName: "RankingProd")
    }

    @NSManaged public var id: Int32
    @NSManaged public var view_count: Int32
    @NSManaged public var ranking: Ranking?

}
