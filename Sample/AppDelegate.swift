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
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		let tokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
		Log.shared.info("Device push notification token - \(tokenString)")
	}

	func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
		Log.shared.error("Failed to register for remote notification. Error \(error)")
	}
}
