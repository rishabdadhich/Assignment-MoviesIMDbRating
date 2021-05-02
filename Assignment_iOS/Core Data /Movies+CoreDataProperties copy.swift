//
//  Movies+CoreDataProperties.swift
//  
//
//  Created by Rishabh on 01/05/21.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var id: String?
    @NSManaged public var imageStr: String?
    @NSManaged public var title: String?
    @NSManaged public var image: Data?

}
