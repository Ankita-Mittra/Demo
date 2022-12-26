//
//  DataModel.swift
//  DemoApp
//
//  Created by Innovation  on 26/12/2022.
//


import Foundation
import SwiftyJSON

struct DataModel: Codable {
    
//    "LocationsApp": {
//      "FileVer": "99",
//      "Dist": "60",
//      "Cordinate": {
//        "item": [
//          {
    
    let id: String? // 1
    let office: String? // 2
    let latitude: String? // 3
    let longitude: String? // 4
    let location: String? // 4

    init(id: String, office: String, latitude: String, longitude: String, location: String){
        self.id = id
        self.office = office
        self.latitude = latitude
        self.longitude = longitude
        self.location = location
    }

//    init(with data:UserEntity?) {
//        self.userId = Int(data?.userId ?? 0)
//        self.id = Int(data?.id ?? 0)
//        self.title = data?.title
//        self.body = data?.body
//    }
//
    init(with data: [String: Any]?) {

        self.id = data?["id"] as? String ?? ""
        self.office = data?["office"] as? String ?? ""
        self.longitude = data?["lon"] as? String ?? ""
        self.latitude = data?["lat"] as? String ?? ""
        self.location = data?["loc"] as? String ?? ""
        
    }
    
    init(json:JSON){
        self.id = json["id"].stringValue
        self.office = json["office"].stringValue
        self.longitude = json["lon"].stringValue
        self.latitude = json["lat"].stringValue
        self.location = json["loc"].stringValue
    }
    
    func toAnyObject() -> Any {
        return [
            "id" : id ?? "",
            "office" : office ?? "",
            "lat": latitude ?? "",
            "lon": longitude ?? "",
            "loc": location ?? ""

        ]
    }
    
}

