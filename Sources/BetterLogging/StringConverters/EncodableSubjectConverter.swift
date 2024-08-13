//
//  EncodableSubjectConverter.swift
//
//
//  Created by Holly Schilling on 8/12/24.
//

import Foundation

public struct EncodableSubjectConverter: SubjectConverter {
    
    public init() { }
    
    public func convert(_ subject: Any) -> String? {
        guard let subject = subject as? Encodable else { return nil }
        let coder = JSONEncoder()
        guard let encoded = try? coder.encode(subject), let encodedString = String(data: encoded, encoding: .utf8) else {
            return nil
        }
        return encodedString
    }
}
