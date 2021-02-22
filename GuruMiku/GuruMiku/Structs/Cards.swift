//
//  Cards.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import Foundation

struct CardMaster: Hashable, Codable, Identifiable {
    var id: Int
    var CardName: String
    var Rarity: Int
    var Character: Int
    var Attribute: Int
    var SkillName: String
    var MaxParameters: [Int]
    var GachaMessage: String
    var ClothCardId: Int
    var DebutOrder: Int
    var StartDate: Int
    var EndDate: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case CardName
        case Rarity
        case Character
        case Attribute
        case SkillName
        case MaxParameters
        case GachaMessage
        case ClothCardId
        case DebutOrder
        case StartDate
        case EndDate
    }
}

var CardMasterAttributes = [
    nil,
    "street",
    "party",
    "cute",
    "cool",
    "elegant"
]
