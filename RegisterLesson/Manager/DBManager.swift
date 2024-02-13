import CoreData
import UIKit
import Foundation

class DBManager {
  static let shared = DBManager()
  private init() {}

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "Model")
      
   

      container.loadPersistentStores(completionHandler: { _, error in
          if let error = error as NSError? {
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
    print(container.persistentStoreCoordinator.persistentStores.first?.url)

      
      return container
  }()


  // MARK: - Core Data Saving support

  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
