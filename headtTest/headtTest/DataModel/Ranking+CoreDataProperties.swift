//
//  Ranking+CoreDataProperties.swift
//  headtTest
//
//  Created by Jay Kumar on 7/15/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension Ranking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ranking> {
        return NSFetchRequest<Ranking>(entityName: "Ranking")
    }

    @NSManaged public var ranking: String?
    @NSManaged public var rankingprod: NSSet?

}

// MARK: Generated accessors for rankingprod
extension Ranking {

    @objc(addRankingprodObject:)
    @NSManaged public func addToRankingprod(_ value: RankingProd)

    @objc(removeRankingprodObject:)
    @NSManaged public func removeFromRankingprod(_ value: RankingProd)

    @objc(addRankingprod:)
    @NSManaged public func addToRankingprod(_ values: NSSet)

    @objc(removeRankingprod:)
    @NSManaged public func removeFromRankingprod(_ values: NSSet)

}
