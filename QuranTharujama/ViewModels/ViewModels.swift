//
//  ViewModels.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI
import Foundation

class AppViewModel: ObservableObject {
    // MARK: - Globaly Shared Application Data
    var app_data = [AppData]()
    @Published var duasData:Duas
    @Published var translationData:Translation
    
    // MARK: - Common Element Properties
    @Published var bgOddCardColorVerse = Color(.sRGB, red: 207/255, green: 216/255, blue: 220/255, opacity: 1)
    @Published var bgOddCardColorSurah = Color(.sRGB, red: 255/255, green: 204/255, blue: 204/255, opacity: 1)
    
    // MARK: - Current Selected Surah
    @Published var cSelectSurah:Surah?
    var scIndex:Int = 0
    
    init() {
        self.app_data = DataService.getData()
        
        self.duasData = self.app_data[0].duas
        self.translationData = self.app_data[0].translation
    }
    
    // MARK: - Surah Navigation Controls
    func beginReadingSurah(sIndex:Int){
        // Find the module ID of the current Selected Surah
        for index in 0..<translationData.records.count{
            if sIndex == translationData.records[index].id {
                self.scIndex = sIndex
                break
            }
        }
        
        
        // Set the current Selected Surah
        cSelectSurah = translationData.records[self.scIndex]
        
//        To Check Fonts
//        for family: String in UIFont.familyNames{
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }
    }
}
