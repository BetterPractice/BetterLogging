//
//  ConsoleLogger.swift
//
//
//  Created by Holly Schilling on 8/12/24.
//

import Foundation


public struct ConsoleLogger: Logger {
    
    public var prefix: String?
    
    public var dateFormatter: DateFormatter?
    
    public var outputFunction: (String) -> Void
    
    public var squelchLevel: LogLevel = .info
    
    public var subjectConverters: [(Any) -> (String?)] = [
        { subject -> String? in
            guard let subject = subject as? CustomStringConvertible else { return nil }
            let described = subject.description
            return described
        },
        { subject -> String? in
            guard let subject = subject as? Encodable else { return nil }
            let coder = JSONEncoder()
            guard let encoded = try? coder.encode(subject), let encodedString = String(data: encoded, encoding: .utf8) else {
                return nil
            }
            return encodedString
        },
        { subject -> String? in
            let described = String(describing: subject)
            return described
        }
    ]
    
    public init(outputFunction: @escaping (String) -> Void) {
        self.outputFunction = outputFunction
    }
    
    public func log(level: LogLevel, _ message: @autoclosure () -> String, subject: Any?) {
        guard level <= squelchLevel else {
            return
        }
        
        var components: [String] = []
        
        if let dateFormatter {
            components.append(dateFormatter.string(from: Date()))
        }
        
        if let prefix {
            components.append(prefix)
        }
        
        components.append(message())
        
        if let subject {
            for converter in subjectConverters {
                if let converted = converter(subject) {
                    components.append("Subject: \(converted)")
                    break
                }
            }
        }
        
        let combined = components.joined(separator: " ")
        outputFunction(combined)
    }
    
}
