//
//  AppDelegate.swift
//  ReactLayeredDomain
//
//  Created by laprasDrum on 2017/12/03.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController.instansiate()
        window?.makeKeyAndVisible()

        return true
    }
}
