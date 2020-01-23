//
//  Person+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Md. Mehedi Hasan on 23/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
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
