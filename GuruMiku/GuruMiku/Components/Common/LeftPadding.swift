//
//  LeftPadding.swift
//  GuruMiku
//
//  Created by Ray on 23/02/21.
//

import Foundation

// solution found at https://stackoverflow.com/a/39215372

extension String {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let newLength = self.count
        if newLength < toLength {
            return String(repeatElement(character, count: toLength - newLength)) + self
        } else {
            return self.substring(from: index(self.startIndex, offsetBy: newLength - toLength))
        }
    }
}
