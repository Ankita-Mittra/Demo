//
//  UserModel.swift
//  DemoApp
//
//  Created by meem on 15/09/2022.
//

import Foundation
import SwiftyJSON

struct UserModel: Codable {

//
//    {
//      "id": "2",
//      "office": "Al MANARA CSO",
//      "lat": "25.15652",
//      "lon": "55.227276",
//      "loc": "Al MANARA"
//    },
//
    
//    "LocationsApp": {
//      "FileVer": "99",
//      "Dist": "60",
//      "Cordinate": {
//        "item": [
//          {
    
    let userId: Int? // 1
    let title: String? // 2
    let id: Int? // 3
    let body: String? // 4
   
    init(userId: Int, id: Int, title: String, body: String){
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }

    init(with data:UserEntity?) {
        self.userId = Int(data?.userId ?? 0)
        self.id = Int(data?.id ?? 0)
        self.title = data?.title
        self.body = data?.body
    }
    
    init(with data: [String: Any]?) {

        self.userId = data?["userId"] as? Int ?? 0
        self.id = data?["id"] as? Int ?? 0
        self.body = data?["body"] as? String ?? ""
        self.title = data?["title"] as? String ?? ""
    }
    
    init(json:JSON){
        self.userId = json["userId"].intValue
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.body = json["body"].stringValue
    }
    
    func toAnyObject() -> Any {
        return [
            "userId" : userId ?? 0,
            "id": id ?? 0,
            "title": title ?? "",
            "body": body ?? "",
        ]
    }
    
}
