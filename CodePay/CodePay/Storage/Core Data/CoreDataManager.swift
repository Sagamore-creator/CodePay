//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation
import CoreData

class CoreDataManager {

    // MARK: - Core Data Stack

    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CodePayDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    static func saveContext () {
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
