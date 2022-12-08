//
//  UsersWebService.swift
//  DemoApp
//
//  Created by meem on 15/09/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

// MARK: - Services

struct UserAPIServices {

     func getData( completion: @escaping (_ data: [String: AnyObject]?, _ succeeded: Bool, _ error: String) -> Void) {
    
        let url = "https://jsonplaceholder.typicode.com/posts"
         
         AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in
                 switch response.result {
                     case .success(let data):
                         do {
                             guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                                 print("Error: Cannot convert data to JSON object")
                                 return
                             }
                             guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                                 print("Error: Cannot convert JSON object to Pretty JSON data")
                                 return
                             }
                             guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                                 print("Error: Could print JSON in String")
                                 return
                             }
                     
                             print("prettyPrintedJson...",prettyPrintedJson)
                             
                             
                         } catch {
                             print("Error: Trying to convert JSON data to string")
                             return
                         }
                     case .failure(let error):
                         print(error)
                 }
             }
         
         
         
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON {response in
//            guard response.result.error == nil else {
//
//                DispatchQueue.main.async(execute: {
//
//                    completion(nil, false, response.result.error.debugDescription)
//                })
//                return
//            }
//            print(response.result.description)
//
//            if let value: AnyObject = response.result.value as AnyObject? {
//                let json = JSON(value)
//
//                print("value result....", value)
//
//                var message = ""; var code = 0;
//                if (value["message"] as AnyObject) as? String != nil {
//                    message = ((value["message"]! as AnyObject) as? String)!
//                    print("message...", message)
//                }
//
//                if (value["code"] as AnyObject) as? Int != nil {
//                    code = ((value["code"]! as AnyObject) as? Int)!
//                    print("code...", code)
//
//                    if code == 200{
//                        DispatchQueue.main.async(execute: {
//
//                            completion(json.dictionaryObject as [String: AnyObject]?, true, message)
//                        })
//                    }else{
//                        completion(json.dictionaryObject as [String: AnyObject]?, false, message)
//                    }
//                }else{
//                    completion(nil, false, response.result.error.debugDescription)
//                }
//
//            } else {
//                completion(nil, false, response.result.error.debugDescription)
//            }
//        }
    }
}


