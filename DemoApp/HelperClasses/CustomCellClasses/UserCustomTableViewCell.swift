//
//  UserCustomTableViewCell.swift
//  DemoApp
//
//  Created by meem on 15/09/2022.
//

import UIKit

class UserCustomTableViewCell: UITableViewCell {

    // MARK: Outlets & Properties
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var userIdLbl: UILabel!

    static let identifier = "UserCustomTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "UserCustomTableViewCell", bundle: nil)
    }
    
    // MARK: Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
