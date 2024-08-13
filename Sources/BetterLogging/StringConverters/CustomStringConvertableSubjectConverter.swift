//
//  CustomStringConvertableSubjectConverter.swift
//  
//
//  Created by Holly Schilling on 8/12/24.
//

import Foundation

public struct CustomStringConvertableSubjectConverter: SubjectConverter {
    
    public init() { }

    public func convert(_ subject: Any) -> String? {
        guard let subject = subject as? CustomStringConvertible else { return nil }
        let described = subject.description
        return described
    }
}
