//
//  ClvCollectionCell.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation
import UIKit

class ClvCollectionCell: UICollectionViewCell
{
    @IBOutlet var restname: UILabel?
    //@IBOutlet var addr: UILabel?
    @IBOutlet weak var addr: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // KEY
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureTextName( _ name: String, _ address: String ) {
        let restname = UILabel(frame: CGRect(x: 10, y: 10, width: 120, height: 40))
        restname.text=name
        self.contentView.addSubview(restname)
        let addr = UILabel(frame: CGRect(x: 10, y: 50, width: 180, height: 40))
        addr.text=address
        self.contentView.addSubview(addr)
    }
    
    private lazy var customUIView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
}
