//
//  Enums.swift
//  GuruMiku
//
//  Created by Ray on 23/02/21.
//

import Foundation

struct PythonEnum: Hashable, Codable {
    
    var value: Int
    var name: String
    
    
    enum CodingKeys: String, CodingKey {
        case value = "_value_"
        case name = "_name_"
    }
}
