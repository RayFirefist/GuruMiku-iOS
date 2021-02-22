//
//  MultipleApiResponse.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import Foundation

struct MultipleApiResponseResult: Codable {
    var CardMaster: [String:CardMaster]
    var CharacterMaster: [String:CharacterMaster]
}

struct MultipleApiResponse: Codable {
    var status: Int
    var errors: [String]
    var result: MultipleApiResponseResult
}
