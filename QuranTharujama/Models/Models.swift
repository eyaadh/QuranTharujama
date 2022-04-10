//
//  Model.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import Foundation

struct AppData: Identifiable, Decodable {
    var id:Int
    var app_version:String
    var app_name:String
    var developer:String
    var translation:Translation
}

struct Translation: Identifiable, Decodable {
    var id:Int
    var module_name:String
    var image:String
    var languages:String
    var records:[Surah]
}

struct Surah: Identifiable, Decodable {
    var id:Int
    var name:String
    var transliteration:String
    var translation:String
    var total_verses:Int
    var verses:[Verse]
    var bookmark:Int
}

struct Verse: Identifiable, Decodable {
    var id:Int
    var text:String
    var translation:String
    var dv_translation:String
}
