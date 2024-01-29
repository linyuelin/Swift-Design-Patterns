//
//  AppDelegate.swift
//  CoordinatorPattern
//
//  Created by dreaMTank on 2024/01/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        // ナビゲーションコントローラの作成
        let navVC = UINavigationController()
        
        //メインコーディネータのs作成
        let coordinator = MainCoordinator()
        coordinator.navigationController = navVC
        //ウィンドウの作成
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        //ナビをウィンドウのルートに設定し、これにより、起動後の再起画面はナビになります
        window.rootViewController = navVC
        
        //ウィンドウの可視化
        window.makeKeyAndVisible()
        
        
        self.window = window
        
        //メインコーディネータの起動
        coordinator.start()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

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


}

