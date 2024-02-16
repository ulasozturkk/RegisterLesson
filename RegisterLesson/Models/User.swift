import CoreData
import Foundation

@objc(User)
public class User: NSManagedObject {
  @NSManaged public var id: UUID?
  @NSManaged public var password: String?
  @NSManaged public var username: String?
  @NSManaged public var avatar: Data?
  @NSManaged public var comment: String?
  @NSManaged public var lessons: NSSet?
}
