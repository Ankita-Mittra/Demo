//
//  ListViewController.swift
//  DemoApp
//
//  Created by Admin on 07/12/2022.
//

import UIKit

class ListViewController: UIViewController {

    // MARK: - Outlets & Properties

    @IBOutlet weak var allUsersTableView: UITableView!
    
    var dataList = [DataModel]()

//    var users = [UserModel]()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial Setup
        
        
        print(list.count)
        
        self.dataList = list
        // Register cell
        self.allUsersTableView.register(UserCustomTableViewCell.nib(), forCellReuseIdentifier: UserCustomTableViewCell.identifier)
        self.allUsersTableView.rowHeight = UITableView.automaticDimension
        self.allUsersTableView.estimatedRowHeight = 100
        
        // Fetch data from Local DB and display on screen
//        self.fetchUsersFromLocalDB()
    }
    
    // MARK: - Methods
    
//    // Method to fetch all Records from local Database
//    func fetchUsersFromLocalDB(){
//        self.dataList = LocalDatabaseQueries.fetchAllUsersFromLocalDB()
//        self.allUsersTableView.reloadData()
//    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Move to Show user Details screen
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        secondViewController.info = self.dataList[indexPath.row]
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        guard  let userCell = self.allUsersTableView.dequeueReusableCell(withIdentifier: UserCustomTableViewCell.identifier , for: indexPath) as? UserCustomTableViewCell else {
            return cell
        }
        let dict = self.dataList[indexPath.row]
        userCell.bodyLbl.text = dict.location
        userCell.titleLbl.text = dict.office
        
        return userCell
    }

}
