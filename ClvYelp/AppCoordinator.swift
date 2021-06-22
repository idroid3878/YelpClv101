//
//  AppCoordinator.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        CDYelpFusionKitManager.shared.configure()
        
        let rlvm=RestaurantsListViewModel()
        let viewController = ViewController.instantiate(viewModel: rlvm)
        let navigationController = UINavigationController(rootViewController: viewController)
        //navigationController.navigationBar.isTranslucent=false

        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}



/*
 self.navigationController?.navigationBar.barTintColor = UIColor.init(rgb: 0xFC6016) //orange
 self.navigationController?.navigationBar.tintColor = UIColor.black
 self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
 navigationController?.navigationBar.isHidden = false
 
 let barbt: UIButton = UIButton(type: UIButton.ButtonType.custom)
 barbt.setImage(UIImage(named: "rightbarbutton"), for: UIControl.State.normal)
 barbt.addTarget(self, action: #selector(myRightSideBarButtonItemTapped), for: UIControl.Event.touchUpInside)
 let rightbarbt = UIBarButtonItem(customView: barbt)
 
 self.navigationItem.rightBarButtonItem = rightbarbt
 
 */
