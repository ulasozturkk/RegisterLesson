

import Foundation
import CoreData

// If you have an @NSManaged property, that property must be declared in the managed object model.
// KAYNAK: https://stackoverflow.com/questions/46679527/what-is-core-data-doing-with-my-manually-written-nsmanaged-properties-i-get-th
extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
}

// MARK: Generated accessors for lessons
extension User {

    @objc(addLessonsObject:)
    @NSManaged public func addToLessons(_ value: Lesson)

    @objc(removeLessonsObject:)
    @NSManaged public func removeFromLessons(_ value: Lesson)

    @objc(addLessons:)
    @NSManaged public func addToLessons(_ values: NSSet)

    @objc(removeLessons:)
    @NSManaged public func removeFromLessons(_ values: NSSet)

}

extension User : Identifiable {

}
