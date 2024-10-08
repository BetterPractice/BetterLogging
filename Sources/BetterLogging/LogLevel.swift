//
//  LogLevel.swift
//
//
//  Created by Holly Schilling on 8/12/24.
//

import Foundation

public enum LogLevel: Int, CustomStringConvertible, Comparable {

    public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case fatal = 0
    case critical = 1
    case warn = 2
    case info = 3
    case verbose = 4
    case debug = 9999
    
    public var description: String {
        let mapping: [Self: String] = [
            .fatal: "FATAL",
            .critical: "CRITICAL",
            .warn: "WARN",
            .info: "INFO",
            .verbose: "VERBOSE",
            .debug: "DEBUG"
        ]
        return mapping[self] ?? "(unknown)"
    }
}
