//
//  UserDetailsViewController.swift
//  DemoApp
//
//  Created by Admin on 07/12/2022.
//

import UIKit

class UserDetailsViewController: UIViewController {

    // MARK: - Outlets & Properties

    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userDescLbl: UILabel!

    var userInfo : UserModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initial Setup
        self.initialSetup()
    }
    
    // MARK: - Methods

    // Methods for initial setup
    func initialSetup(){
        
        self.usernameLbl.text = userInfo.title
        self.userIdLbl.text = userInfo.userId?.codingKey.stringValue
        self.userDescLbl.text = userInfo.body
    }

}
