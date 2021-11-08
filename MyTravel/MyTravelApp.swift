//
//  MyTravelApp.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/04.
//

import SwiftUI
import Firebase

@main
struct MyTravelApp: App {
    
    //->12부터는 델리게이트가 아니라 여기에 파이어 베이스를 연결
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
           LoginView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("파이어 베이스 api 호출")
        FirebaseApp.configure()
        return true
    }
}
