//
//  AppDelegate.swift
//  Tabbar
//
//  Created by Trung Kiên on 8/1/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = setTabbarController()
        window?.makeKeyAndVisible()
        return true
    }
    func setTabbarController() -> UITabBarController {
        let home = HomeViewController()
        let buy = BuyViewController()
        let order = OrderViewController()
        let pay = PayViewController()
        
        let narHome = UINavigationController(rootViewController: home)
        let narBuy = UINavigationController(rootViewController: buy)
        let narOrder = UINavigationController(rootViewController: order)
        let narPay = UINavigationController(rootViewController: pay)
        
        narHome.isNavigationBarHidden = true
        narBuy.isNavigationBarHidden = true
        narOrder.isNavigationBarHidden = true
        narPay.isNavigationBarHidden = true
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [narHome,narBuy,narOrder,narPay]
        let tabbar = tabbarController.tabBar
        tabbar.barTintColor = UIColor.orange
        tabbar.backgroundColor = UIColor.yellow
        
       // let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
      //  let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)
        
       let attributes = [NSAttributedStringKey.font:  UIFont(name: "Helvetica-Bold", size: 15.0)!, NSAttributedStringKey.foregroundColor: UIColor.white]
        
         let attributes1 = [NSAttributedStringKey.font:  UIFont(name: "Helvetica-Bold", size: 15.0)!, NSAttributedStringKey.foregroundColor: UIColor.blue]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes1, for: .selected)
        
        let tabHome = tabbar.items![0]
        tabHome.title = "Home"
        tabHome.image=UIImage(named: "home_notcheck")?.withRenderingMode(.alwaysOriginal) 
        tabHome.selectedImage = UIImage(named: "home_check")?.withRenderingMode(.alwaysOriginal)
        let tabBuy = tabbar.items![1]
        tabBuy.title = "Buy"
        tabBuy.image=UIImage(named: "home_notcheck")?.withRenderingMode(.alwaysOriginal)
        tabBuy.selectedImage = UIImage(named: "home_check")?.withRenderingMode(.alwaysOriginal)
        let tabOrder = tabbar.items![2]
        tabOrder.title = "Order"
        tabOrder.image=UIImage(named: "home_notcheck")?.withRenderingMode(.alwaysOriginal)
        tabOrder.selectedImage = UIImage(named: "home_check")?.withRenderingMode(.alwaysOriginal)
        let tabPay = tabbar.items![3]
        tabPay.title = "Pay"
        tabPay.image=UIImage(named: "home_notcheck")?.withRenderingMode(.alwaysOriginal)
        tabPay.selectedImage = UIImage(named: "home_check")?.withRenderingMode(.alwaysOriginal)
        
        return tabbarController
        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

