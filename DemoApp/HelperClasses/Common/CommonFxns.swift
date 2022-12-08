//
//  CommonFxns.swift
//  DemoApp
//
//  Created by meem on 15/09/2022.
//

import Foundation
import SystemConfiguration
import SwiftyJSON
import MBProgressHUD


class CommonFxns: NSObject {
    static var globalHud:MBProgressHUD?

    // Method to check internet connectivity
    class func isInternetAvailable() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    // Method to trim Strings
    class func trimString(string:String) -> String{
        return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    // Method to check Email Validations
    class func isValidString(str:String) -> Bool {
        let emailRegEx = "^[0-9a-zA-Z]{4,25}$" // "^[0-9a-zA-Z\\_]{4,15}$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str)
    }
    
    // Method to check Email Validations
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"// "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    // Show activity Indicator
    class func showProgress()->Void{
        globalHud?.removeFromSuperViewOnHide = true
        globalHud?.hide(animated: false)
        let window:UIWindow = UIApplication.shared.windows.last!
        globalHud = MBProgressHUD.showAdded(to: window, animated: true)
        globalHud?.bezelView.color = UIColor.clear // Your backgroundcolor
        globalHud?.bezelView.style = .solidColor
    }
    
    // Hide activity Indicator
   class func dismissProgress()->Void{
       globalHud?.hide(animated: true)
       
    }
    
    // Method to Show default Alert view with message
    class func showAlert (_ reference:UIViewController, message:String, title:String){
        var alert = UIAlertController()
        if title == "" {
            alert = UIAlertController(title: nil, message: message,preferredStyle: UIAlertController.Style.alert)
        }
        else{
            alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)
        }
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        reference.present(alert, animated: true, completion: nil)
    }
    
}
