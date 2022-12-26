//
//  UserAPIServices.swift
//  DemoApp
//
//  Created by meem on 15/09/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

// MARK: - Services

struct UserAPIServices {

    // [[String:AnyObject]]
    func getUsersData( completion: @escaping (_ data: [String:AnyObject]?, _ succeeded: Bool, _ error: String) -> Void) {
    
        
//        let url = "https://jsonplaceholder.typicode.com/posts"
         
        let url = "https://smartoffice.dewa.gov.ae/dev/DewaLocations.json"
        

        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in

                 switch response.result {
                     case .success(let data):
                     CommonFxns.dismissProgress()

                         do {

                             guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? Any else {
                                 print("Error: Cannot convert data to JSON object")
                                 
                                 return completion(nil, false, response.error.debugDescription)

                             }
                             guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                                 print("Error: Cannot convert JSON object to Pretty JSON data")
                                 return completion(nil, false, response.error.debugDescription)

                             }
                             guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                                 print("Error: Could print JSON in String")
                                 return completion(nil, false, response.error.debugDescription)
                             }
                             
                              print("prettyPrintedJson...", prettyPrintedJson)
                             completion(prettyPrintedJson.toJSON() as? [String:AnyObject], true, "")
                         } catch {
                             print("Error: Trying to convert JSON data to string")
                             return
                         }
                     case .failure(let error):
                         print( "failure....", error)

                     completion(nil, false, response.error.debugDescription)

                 }
             }
    }
}


extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
