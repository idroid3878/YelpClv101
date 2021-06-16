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
    @IBOutlet weak var addrsol: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(imageurl)")
        
        reviewol?.text = "REVIEW: " + String(review)
        nameol?.text = "NAME: " + name
        
        let url = URL(string: imageurl)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        imageurlol!.image = UIImage(data: data!)
        addressol?.text = "ADDRESS: " + address.joined(separator: " ")
    }
}

