//
//  AppDelegate.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : AnyObject! = storyboard.instantiateInitialViewController()
       // self.window!.rootViewController = vc as UIViewController
        window?.rootViewController = vc as? UIViewController
        self.window!.makeKeyAndVisible()
        */
        
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
        
        
        //self.window = UIWindow(frame: UIScreen.main.bounds)
        //let controller = ViewController()
        //window?.rootViewController = controller
        //window?.makeKeyAndVisible()
        
        return true
    }

    // Unavailable in iOS11
    // MARK: UISceneSession Lifecycle
    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    */

}

