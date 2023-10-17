//
//  AppDelegate.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 12/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let nc = UINavigationController(rootViewController: HomeVC(nibName: "HomeVC", bundle: nil))
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }

    

}

