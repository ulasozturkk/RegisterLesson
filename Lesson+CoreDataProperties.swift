//
//  Lesson+CoreDataProperties.swift
//  RegisterLesson
//
//  Created by macbook pro on 13.02.2024.
//
//

import Foundation
import CoreData


extension Lesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lesson> {
        return NSFetchRequest<Lesson>(entityName: "Lesson")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var updateDate: String?
    @NSManaged public var grade: Double
    @NSManaged public var toUser: User?

}

extension Lesson : Identifiable {

}
