//
//  String+Extension.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import Foundation

extension String {
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
