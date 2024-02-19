import Foundation
import CoreData

class UserManager {
    
    static let shared = UserManager()
    
    private init() {}
    
    // MARK: - CRUD Operations
    
    func createUser(name: String, email: String) {
        let context = DBManager.shared.persistentContainer.viewContext
        let newUser = User(context: context)
        newUser.username = name
        newUser.password = email
        DBManager.shared.saveContext()
    }
    
    func fetchAllUsers() -> [User] {
        let context = DBManager.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            return users
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteUser(user: User) {
        let context = DBManager.shared.persistentContainer.viewContext
        context.delete(user)
        DBManager.shared.saveContext()
    }
  // MARK: - Lesson Management
     
     func addLessonToUser(user: User, lesson: Lesson) {
         user.addToLessons(lesson)
         DBManager.shared.saveContext()
     }
     
     func removeLessonFromUser(user: User, lesson: Lesson) {
         user.removeFromLessons(lesson)
         DBManager.shared.saveContext()
     }
     
     func addLessonsToUser(user: User, lessons: NSSet) {
         user.addToLessons(lessons)
       DBManager.shared.saveContext()
     }
     
     func removeLessonsFromUser(user: User, lessons: NSSet) {
         user.removeFromLessons(lessons)
       DBManager.shared.saveContext()
     }
}
