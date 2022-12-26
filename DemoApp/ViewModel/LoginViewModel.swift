//
//  LoginViewModel.swift
//  DemoApp
//
//  Created by Admin on 07/12/2022.
//

import Foundation
import SwiftyJSON
var list = [DataModel]()

class LoginViewModel{
    
    //MARK: - Properties
   
    var dataList : [DataModel]? {
        didSet{
            didFinish?()
        }
    }
    private var apiService = UserAPIServices()

    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: ((String) -> ())?
    var didFinish: (() -> ())?
        
    // MARK: - Network call
    
    func fetchUsers() {
        CommonFxns.showProgress()
        apiService.getUsersData { data, succeeded, error in
            
            if succeeded{
                
//                "LocationsApp": {
//                  "FileVer": "99",
//                  "Dist": "60",
//                  "Cordinate": {
//                    "item": [
//
//
//                let dict = response.result.value as? NSDictionary
                
                let dict = data as? NSDictionary
                
                let locationApp = dict?.value(forKey: "LocationsApp") as? NSDictionary
                
                
                let Cordinate = locationApp?.value(forKey: "Cordinate") as? NSDictionary
                
                let item = Cordinate?.value(forKey: "item") as? [[String:Any]]

                print("dict...", dict)
                
                for i in item!{
                    let data = DataModel(with: i)
                    list.append(data)
                }
                
                self.dataList = list
                
                print("dataList.........", self.dataList)

                
//                self.saveUsersLocally(users: users)
                // save locally
            }
            if error != ""{
                self.showAlertClosure?(error)
            }
        }
    }
    
    //MARK: - Local DB Operations
    
//    // save groups to local db
//    func saveUsersLocally(users:[UserModel]){
//        LocalDatabaseQueries.addAndUpdateUsersInLocalDB(users: users)
//
//        self.dataList = users
//    }
    
}

// MARK: - UIPickerViewDelegate

extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.countryTextField.text = countries[row]
        self.view.endEditing(true)
    }

}

