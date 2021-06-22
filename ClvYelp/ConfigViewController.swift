//
//  ConfigViewController.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-19.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var latitude_value: UITextField!
    @IBOutlet weak var longitude_value: UITextField!
    @IBOutlet weak var radius_value: UITextField!
    
    private var gpsViewModel: LocationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.latitude_value.delegate = self
        self.longitude_value.delegate = self
        self.radius_value.delegate = self
        
        getDefaultGPS()
    }
    
    func getDefaultGPS() {
        let lat = Double(latitude_value.text!)
        let lon = Double(longitude_value.text!)
        let rad = Int(radius_value.text!)
        self.gpsViewModel = LocationViewModel(loc: LocationModel(latitude: lat!, longitude: lon!, radius: rad!) )
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == latitude_value {
            print("lat \(String(describing: textField.text))")
        }
        else if textField == longitude_value {
            print("long \(String(describing: textField.text))")
        }
        else if textField == radius_value {
            print("rad \(String(describing: textField.text))")
        }
        getDefaultGPS()
    }

}
