//
//  LocalDatabaseQueries.swift
//  DemoApp
//
//  Created by meem on 15/09/2022.
//

import UIKit
import CoreData

@objc class LocalDatabaseQueries: NSObject {

    // Fetch all users from Local Database
   class func fetchAllUsersFromLocalDB() -> [UserModel]{
               
        let context = appDelegate.persistentContainer.viewContext
                
        var usersList = [UserModel]()
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
       do {
           // Peform Fetch Request
           let users = try context.fetch(fetchRequest)

           for user in users{
               let dict = UserModel(with: user)
               usersList.append(dict)
           }
       } catch {
           print("Unable to Fetch records, (\(error))")
       }
        return usersList
    }
    
    class func deleteUserDbData(){
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(batchDeleteRequest)
        } catch {
            print("Unable to Fetch records, (\(error))")
        }
    }
    
    // Add All users in Local database
    class func addAndUpdateUsersInLocalDB(users: [UserModel]){
        self.deleteUserDbData()
        
        let context = appDelegate.persistentContainer.viewContext

        users.forEach({ user in
            do {
//                let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
//                request.predicate = NSPredicate(format: "id == %@", user.userId!) // Find Contact
                let _user = UserEntity(context: context)

                _user.id = Int16(user.id ?? 0)
                _user.userId = Int16(user.userId ?? 0)
                _user.title = user.title ?? ""
                _user.body = user.body ?? ""
                try context.save()

            } catch {
                print("Failed to fetch video:", error)
            }
        })
    }
}
