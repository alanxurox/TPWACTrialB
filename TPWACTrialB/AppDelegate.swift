//
//  AppDelegate.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/12/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

var currentUser : User = User()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GIDSignIn.sharedInstance().clientID = "906622870206-mcpbab2d28a3qiacv1uv15i373jd2o9e.apps.googleusercontent.com"
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().delegate = self
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

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
        currentUser.setUserID(userID: user.userID)
        currentUser.setIDToken(idToken: user.authentication.idToken)
        currentUser.setFullName(fullName: user.profile.name)
        currentUser.setGivenName(givenName: user.profile.givenName)
        currentUser.setFamilyName(familyName: user.profile.familyName)
        currentUser.setEmail(email: user.profile.email)
        currentUser.setStatus(status: "Active")
        currentUser.checkFaculty()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
      // Perform any operations when the user disconnects from app here.
      // ...
        currentUser.setStatus(status: "Inactive")
    }


}

