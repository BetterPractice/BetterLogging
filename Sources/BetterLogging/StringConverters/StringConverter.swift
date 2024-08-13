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
