//
//  UsersListViewController.swift
//  DemoApp
//
//  Created by Admin on 07/12/2022.
//

import UIKit

class UsersListViewController: UIViewController {

    // MARK: - Outlets & Properties

    @IBOutlet weak var allUsersTableView: UITableView!
    var users = [UserModel]()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial Setup
        
        // Register cell
        self.allUsersTableView.register(UserCustomTableViewCell.nib(), forCellReuseIdentifier: UserCustomTableViewCell.identifier)
        self.allUsersTableView.rowHeight = UITableView.automaticDimension
        self.allUsersTableView.estimatedRowHeight = 100
        
        // Fetch data from Local DB and display on screen
        self.fetchUsersFromLocalDB()
    }
    
    // MARK: - Methods
    
    // Method to fetch all Records from local Database
    func fetchUsersFromLocalDB(){
        self.users = LocalDatabaseQueries.fetchAllUsersFromLocalDB()
        self.allUsersTableView.reloadData()
    }
    
}

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Move to Show user Details screen
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        secondViewController.userInfo = self.users[indexPath.row]
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        guard  let userCell = self.allUsersTableView.dequeueReusableCell(withIdentifier: UserCustomTableViewCell.identifier , for: indexPath) as? UserCustomTableViewCell else {
            return cell
        }
        let dict = self.users[indexPath.row]
        userCell.bodyLbl.text = dict.body
        userCell.titleLbl.text = dict.title
        
        return userCell
    }

}
