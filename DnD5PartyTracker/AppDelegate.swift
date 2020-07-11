//
//  AppDelegate.swift
//  DnD5PartyTracker
//

import UIKit

@UIApplicationMain fileprivate class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: UIApplicationDelegate

    /// - SeeAlso: UIApplicationDelegate.window
    @objc fileprivate lazy var window: UIWindow? = {
        UIWindow(frame: UIScreen.main.bounds)
    }()

    /// - SeeAlso: UIApplicationDelegate.application(_:didFinishLaunchingWithOptions:)
    fileprivate func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window!.rootViewController = PartyTrackerViewController()
        window!.makeKeyAndVisible()
        return true

    }
}

