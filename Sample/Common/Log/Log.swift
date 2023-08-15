//
//  Log.swift
//  sample
//
//  Created by Vineet Choudhary on 15/08/23.
//

import Foundation
import OSLog

public class Log {
	static let shared = Logger(subsystem: "co.developerinsider.sample", category: "shared")
	static let ui = Logger(subsystem: "co.developerinsider.sample", category: "UI")
	
	private init() { }
}
