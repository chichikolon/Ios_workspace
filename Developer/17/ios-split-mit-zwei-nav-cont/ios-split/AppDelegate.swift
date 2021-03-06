//
//  AppDelegate.swift
//  ios-split
//
//  Created by Michael Kofler on 31.08.16.
//  Copyright © 2016 Michael Kofler. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  // Querverweise auf diverse Controller hier zentral
  // zugänglich machen
  var splitVC:   UISplitViewController?
  var leftNC:    UINavigationController?
  var masterTVC: MasterTVC?
  var detailVC:  DetailVC?

  // Initialisierung
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions:
                      [UIApplicationLaunchOptionsKey: Any]?)
    -> Bool
  {
    // initialisiert diverse Controller-Variablen
    splitVC =
      self.window!.rootViewController as? UISplitViewController
    leftNC =
      splitVC?.viewControllers.first as? UINavigationController
    masterTVC =
      leftNC?.topViewController as? MasterTVC
    let secondNC = splitVC?.viewControllers.last as? UINavigationController
    detailVC =
      secondNC?.topViewController as? DetailVC
    
    // Back-Button immer anzeigen
    // https://www.raywenderlich.com/94443
    detailVC?.navigationItem.leftItemsSupplementBackButton = true
    detailVC?.navigationItem.leftBarButtonItem =
       splitVC?.displayModeButtonItem
    
    return true
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

