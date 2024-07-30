//
//  Optional+extension.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import Foundation

extension Optional {
    public var isNil: Bool {
        self == nil
    }
    
    public var isNotNil: Bool {
        isNil.isFalse
    }
}
