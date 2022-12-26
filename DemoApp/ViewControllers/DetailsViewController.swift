//
//  DetailsViewController.swift
//  DemoApp
//
//  Created by Admin on 07/12/2022.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    // MARK: - Outlets & Properties

    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userDescLbl: UILabel!


    var info : DataModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initial Setup
        self.initialSetup()
    }
    
    // MARK: - Methods

    // Methods for initial setup
    func initialSetup(){
        
        self.usernameLbl.text = info.office
        self.userIdLbl.text = info.id?.codingKey.stringValue
        self.userDescLbl.text = info.location
    }
    
    func openGoogleMap() {

        let latDouble = info.latitude
        let longDouble = info.longitude
        
          if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an app

              if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(String(describing: latDouble)),\(longDouble)&directionsmode=driving") {
                        UIApplication.shared.open(url, options: [:])
               }}
          else {
                 //Open in browser
              if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(String(describing: latDouble)),\(longDouble)&directionsmode=driving") {
                                   UIApplication.shared.open(urlDestination)
                            }
                }
    }


    @IBAction func nextBtnAction(_ sender: Any) {
        
        
                let latDouble = info.latitude!
                let longDouble = info.longitude!
        OpenMapDirections.present(in: self, sourceView: self.view, lat:latDouble,  long: longDouble)


//
//        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
//            UIApplication.shared.openURL(NSURL(string:
//                                                            "comgooglemaps://?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving")! as URL)
//
//                } else {
//                    NSLog("Can't use comgooglemaps://");
//                }
  }
//        self.openGoogleMap()
}
