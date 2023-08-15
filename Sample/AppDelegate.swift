//
//  AppDelegate.swift
//  Sample
//
//  Created by Vineet Choudhary on 15/08/23.
//

import Foundation
import UIKit
import OSLog

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

		// request push notification authorization
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { allowed, error in
			if allowed {
				// register for remote push notification
				DispatchQueue.main.async {
					UIApplication.shared.registerForRemoteNotifications()
				}
				Log.shared.info("Push notification allowed by user")
			} else {
				Log.shared.debug("Error while requesting push notification permission. Error \(error)")
			}
		}
		return true
	}


	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		let tokenString = deviceToken.reduce("", {$0 + String(format: "%02x", $1)})
		Log.shared.info("Device push notification token - \(tokenString)")
	}

	func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
		Log.shared.error("Failed to register for remote notification. Error \(error)")
	}
}
