//
//  CoreData.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import Foundation
import CoreData


class CoreData {
    
    static var Shared = CoreData()

    func insertPhotoIntoStorage(id: String, name: String, image: String){
        
        let context = CoreData.Shared.persistentContainer.viewContext
        let newPhoto = HeroPhoto(context: context)
        newPhoto.id = id
        newPhoto.name = name
        newPhoto.image = image
        saveContext()
    }
    
    
    func getAllImagesFromStorage() -> [HeroPhoto] {
       
        
        var result = [HeroPhoto]()
        let photoFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "HeroPhoto")


        do {
            result = try (persistentContainer.viewContext.fetch(photoFetch) as? [HeroPhoto])!

          print( result.count)
        }catch {
            print (error)

        }
        return result
        
    }
    
    
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "photoDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
             
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

   

    func saveContext () {
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

