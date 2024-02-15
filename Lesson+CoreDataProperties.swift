//
//  Lesson+CoreDataProperties.swift
//  RegisterLesson
//
//  Created by macbook pro on 15.02.2024.
//
//

import Foundation
import CoreData


extension Lesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lesson> {
        return NSFetchRequest<Lesson>(entityName: "Lesson")
    }


}

extension Lesson : Identifiable {

}
