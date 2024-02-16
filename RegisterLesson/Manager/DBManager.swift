import CoreData
import Foundation
import UIKit

class DBManager {
  static let shared = DBManager()
  private init() {}

  // MARK: - ManagedObjectModel

  // uygulamanın object modelini tanımladık
  lazy var managedObjectModel: NSManagedObjectModel = {
    guard let modelURL = Bundle.main.url(forResource: "Model", withExtension: "momd") else {
      fatalError("Error loading model ")
    }
    guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
      fatalError("Error initializing managed object model")
    }
    return managedObjectModel
  }()

  // MARK: - persistentStoreURL

  // localde saklanacak fiziksel dosyanın url sini oluşturmak gerekiyor
  lazy var persistentStoreURL: URL = {
    let storeURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!.appendingPathComponent("Model.sqlite")
    return storeURL
  }()

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Model")

    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
    // depolama-güncelleme işlemlerini yürüten class -> Coordinator

    do {
      let options = [NSInferMappingModelAutomaticallyOption: true,
                     NSMigratePersistentStoresAutomaticallyOption: true]

      try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                         configurationName: nil,
                                         at: persistentStoreURL,
                                         options: options)
    } catch {
      fatalError("Unable to Load Persistent Store")
    }

    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })

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
