//
//  DefaultSubjectConverter.swift
//  
//
//  Created by Holly Schilling on 8/12/24.
//

import Foundation

public struct DefaultSubjectConverter: SubjectConverter {
    
    public init() { }

    public func convert(_ subject: Any) -> String? {
        return String(describing: subject)
    }
}
