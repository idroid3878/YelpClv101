//
//  DetailViewController.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    public var review: Int = 0
    public var imageurl: String = ""
    public var name: String = ""
    public var address: [String] = []
    
    @IBOutlet var reviewol: UILabel?
    @IBOutlet var imageurlol: UIImageView?
    @IBOutlet weak var addressol: UITextView!
    @IBOutlet var nameol: UILabel?
    
    @objc func myRightSideBarButtonItemTapped(_ sender: UIBarButtonItem!)
    {
        print("myRightSideBarButtonItemTapped")
     //   self.performSegue(withIdentifier: "sequeToDetail", sender: self)
    }
    
    func setNavBarSetupButton() {
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 252/255, green: 169/255, blue: 3/255, alpha: 1.0)//UIColor.init(rgb: 0xFC6016)
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        let barbt: UIButton = UIButton(type: UIButton.ButtonType.custom)
        barbt.setImage(UIImage(named: "rightbarbutton"), for: UIControl.State.normal)
        barbt.addTarget(self, action: #selector(myRightSideBarButtonItemTapped), for: UIControl.Event.touchUpInside)
        let rightbarbt = UIBarButtonItem(customView: barbt)
        navigationController?.navigationBar.topItem?.title = "Main"
        //navigationItem.title = "Detail"
        
        navigationItem.rightBarButtonItem = rightbarbt
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("\(imageurl)")
        
        setNavBarSetupButton()
        
        reviewol?.text = "REVIEW: " + String(review)
        nameol?.text = "NAME: " + name
        
        let url = URL(string: imageurl)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        imageurlol!.image = UIImage(data: data!)
        addressol?.text = "ADDRESS: " + address.joined(separator: " ")
    }
}

