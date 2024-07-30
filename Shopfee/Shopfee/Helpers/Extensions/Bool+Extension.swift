//
//  Bool+Extension.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import Foundation

extension Bool {
    public var isTrue: Bool {
        self
    }
    
    public var isFalse: Bool {
        self == false
    }
}
 
extension Optional where Wrapped == Bool {
    public var orTrue: Bool {
        self ?? true
    }
    
    public var orFalse: Bool {
        self ?? false
    }
}
