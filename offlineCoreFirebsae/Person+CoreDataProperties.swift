//
//  Person+CoreDataProperties.swift
//  offlineCoreFirebsae
//
//  Created by saad pasta on 28/05/2019.
//  Copyright © 2019 saad pasta. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}
