//
//  UserEntity+CoreDataProperties.swift
//  DemoApp
//
//  Created by meem on 15/09/2022.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var userId: Int16
    @NSManaged public var id: Int16

}

extension UserEntity : Identifiable {

}
