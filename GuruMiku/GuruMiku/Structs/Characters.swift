//
//  Characters.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import Foundation

struct CharacterMaster: Hashable, Codable {
    
    var Id: Int
    var FullName: String
    var FirstName: String
    var FirstNameEnglish: String
    var Unit: Int
    var ProfileAnswers: [String]
    var FullNameEnglish: String
    var ColorCode: String
    
}
