//
//  AppDelegate.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 22/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = TabBarViewController()
        //let nav = UINavigationController(rootViewController: vc)
        setNav()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
    func setNav(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemOrange
        UINavigationBar.appearance().layer.cornerRadius = 12
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

