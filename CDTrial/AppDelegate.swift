//
//  AppDelegate.swift
//  CDTrial
//
//  Created by Nanda Mochammad on 02/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

        self.saveContext()
    }
    
    //COTE DATASTACK
    //Add "lazy" variable which inherit to NSPersistentContainer
    lazy var persistentContainer: NSPersistentContainer = {
        //Create Container which have same name with our datamodel
        let container = NSPersistentContainer(name: "ContactModel")
        //loadPersistentStore to container
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            //Check if the data not nill they'll be executed
            if let error = error as NSError? {
                
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        //Define Context
        let context = persistentContainer.viewContext
        
        //Give an action if the context has changes
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

