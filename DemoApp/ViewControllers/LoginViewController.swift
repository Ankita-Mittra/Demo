//
//  LoginViewController.swift
//  DemoApp
//
//  Created by Admin on 07/12/2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{

    // MARK: - Outlets & Properties

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var maritalStatusTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!

    let viewModel = LoginViewModel()
    var list = [DataModel]()
    let countries = ["Japan","India", "Georgia", "US", "United Arab Emirates"]
    let pickerView = UIPickerView()
    
//    let UserListViewControllerObjectiveCFile = ListViewController()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initial Setup
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.countryTextField.inputView = pickerView
        
        
        
//        UserListViewControllerObjectiveCFile.displayMessageFromCreatedObjectiveCFile()

    }
    
    // MARK: - Methods
    
    func gotoNextScreen(){
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController

        secondViewController.dataList = list
        
        
        
        print("self.list.....", self.list.count)
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    // MARK: - Button Actions

    @IBAction func marriedCheckBoxAction(_ sender: UIButton) {
        if sender.isSelected{
            maritalStatusTextField.text = "" }else{
            maritalStatusTextField.text = "Married"
        }
        sender.isSelected = !sender.isSelected
    }

    @IBAction func submitBtnAction(_ sender: Any) {

        CommonFxns.isValidEmail(testStr: CommonFxns.trimString(string: self.emailTextField.text ?? "")) ? self.fetchDataFromServer(): CommonFxns.showAlert(self, message: "Please Enter valid Email", title: "Error")
    }

    // MARK: - Text Field delegates

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: - Network's Calls
    
    private func fetchDataFromServer() {
        viewModel.showAlertClosure = {
            error in
            print("showAlertClosure")

            CommonFxns.showAlert(self, message: error, title: "Alert")
        }
        viewModel.didFinish = {
            print("self.list.count...", self.list.count)
            self.gotoNextScreen()
        }
        
        
        viewModel.fetchUsers()
    }
    
}

