//
//  SubjectConverter.swift
//
//
//  Created by Holly Schilling on 8/12/24.
//

import Foundation

public protocol SubjectConverter {
    
    func convert(_ subject: Any) -> String?
}


public struct EncodableSubjectConverter: SubjectConverter {
    
    public func convert(_ subject: Any) -> String? {
        guard let subject = subject as? Encodable else { return nil }
        let coder = JSONEncoder()
        guard let encoded = try? coder.encode(subject), let encodedString = String(data: encoded, encoding: .utf8) else {
            return nil
        }
        return encodedString
    }
}

public struct CustomStringConvertableSubjectConverter: SubjectConverter {
    
    public func convert(_ subject: Any) -> String? {
        guard let subject = subject as? CustomStringConvertible else { return nil }
        let described = subject.description
        return described
    }
}

public struct DefaultSubjectConverter: SubjectConverter {
    
    public func convert(_ subject: Any) -> String? {
        return String(describing: subject)
    }
}
