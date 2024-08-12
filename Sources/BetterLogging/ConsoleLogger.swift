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
    
    public var subjectConverters: [SubjectConverter] = [
        CustomStringConvertableSubjectConverter(),
        EncodableSubjectConverter(),
        DefaultSubjectConverter()
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
                if let converted = converter.convert(subject) {
                    components.append("Subject: \(converted)")
                    break
                }
            }
        }
        
        let combined = components.joined(separator: " ")
        outputFunction(combined)
    }
    
}
