//
//  LoginViewModel.swift
//  DemoApp
//
//  Created by Admin on 07/12/2022.
//

import Foundation
import SwiftyJSON

class LoginViewModel{
    
    //MARK: - Properties
   
    var usersList : [UserModel]? {
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
                
                var users = [UserModel]()
                for i in data!{
                    let user = UserModel(with: i)
                    users.append(user)
                }
                self.saveUsersLocally(users: users)
                // save locally
            }
            if error != ""{
                self.showAlertClosure?(error)
            }
        }
    }
    
    //MARK: - Local DB Operations
    
    // save groups to local db
    func saveUsersLocally(users:[UserModel]){
        LocalDatabaseQueries.addAndUpdateUsersInLocalDB(users: users)
        
        self.usersList = users
    }
    
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

