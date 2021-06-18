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
        navigationController.navigationBar.isTranslucent=false
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
