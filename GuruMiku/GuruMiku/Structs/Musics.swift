//
//  Musics.swift
//  GuruMiku
//
//  Created by Ray on 23/02/21.
//

import Foundation

struct MusicMaster: Hashable, Codable, Identifiable {
    var id: Int
    var Name: String
    var ReadName: String
    var Lyrist: String
    var Composer: String
    var Arranger: String
    var SpecialUnitName: String
    var Category: PythonEnum
    var Unit: Int
    var DefaultOrder: Int
    var MusicBpm: Float
    var OpenKey: Int
    var SectionTrend: PythonEnum
    var EnableLongMix: Bool
    var StartDate: Int
    var EndDate: Int
    var HasMovie: Bool
    //var ExcludeChallenge: [Int]
    var IsTutorial: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case Name
        case ReadName
        case Lyrist
        case Composer
        case Arranger
        case SpecialUnitName
        case Category
        case Unit
        case DefaultOrder
        case MusicBpm
        case OpenKey
        case SectionTrend
        case EnableLongMix
        case StartDate
        case EndDate
        case HasMovie
        //case ExcludeChallenge
        case IsTutorial
        
    }
}
