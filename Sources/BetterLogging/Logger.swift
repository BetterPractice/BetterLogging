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

    public func log(_ message: @autoclosure () -> String) {
        log(level: .info, message(), subject: nil)
    }
    
    public func log(_ message: @autoclosure () -> String, subject: Any?) {
        log(level: .info, message(), subject: subject)
    }
    
    public func log(level: LogLevel, _ message: @autoclosure () -> String) {
        log(level: level, message(), subject: nil)
    }
}
