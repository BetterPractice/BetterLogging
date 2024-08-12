//
//  Logger.swift
//
//
//  Created by Holly Schilling on 8/12/24.
//

import Foundation

public protocol Logger {
    func log(level: LogLevel, _ message: @autoclosure () -> String, subject: Any?)
}

extension Logger {

    func log(_ message: @autoclosure () -> String) {
        log(level: .info, message(), subject: nil)
    }
    
    func log(_ message: @autoclosure () -> String, subject: Any?) {
        log(level: .info, message(), subject: subject)
    }
    
    func log(level: LogLevel, _ message: @autoclosure () -> String) {
        log(level: level, message(), subject: nil)
    }
}
