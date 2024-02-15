import Foundation
import CoreData

@objc(Lesson)
public class Lesson: NSManagedObject {
  
  @NSManaged public var grade: Double
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var updateDate: String?
  @NSManaged public var toUser: User?
}
