//
//  Model.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import Foundation

struct Surah: Identifiable, Decodable {
    var id:Int
    var name:String
    var transliteration:String
    var translation:String
    var total_verses:Int
    var verses:[Verse]
}

struct Verse: Identifiable, Decodable {
    var id:Int
    var text:String
    var translation:String
    var dv_translation:String
}
