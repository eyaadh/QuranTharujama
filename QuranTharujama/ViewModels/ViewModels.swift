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
    
    // MARK: - Current Navigation Tag
    @Published var cNavTag:Int?
    
    init() {
        self.app_data = DataService.getData()
        
        self.duasData = self.app_data[0].duas
        self.translationData = self.app_data[0].translation
        self.cSelectSurah = self.translationData.records[1]
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
        
        
    }
    
    // MARK: - Check if there is a next Surah
    func isNextSurahAvailable() -> Bool {
        return self.translationData.records.count > (self.scIndex + 1)
    }
    
    // MARK: - Check if there is a previous Surah
    func isPreviousSurahAvailable() -> Bool {
        return 0 <= (self.scIndex - 1) 
    }
    
    // MARK: - Advance to next Surah
    func advanceToNextSurah() {
        // increase the scIndex counter
        self.scIndex += 1
        
        // if the index is within range advance otherwise start with first
        if self.scIndex < self.translationData.records.count {
            cSelectSurah = self.translationData.records[self.scIndex]
        } else {
            self.scIndex = 0
            cSelectSurah = self.translationData.records[0]
        }
    }
    
    // MARK: - Move to previous Surah
    func moveToPreviousSurah() {
        // increase the scIndex counter
        self.scIndex -= 1
        
        // if the index is grater than 0 then move to previous Surah
        if self.scIndex > 0 {
            cSelectSurah = self.translationData.records[self.scIndex]
        } else {
            self.scIndex = 0
            cSelectSurah = self.translationData.records[0]
        }
    }
    
    // MARK: - Bookmark Color Decider
    func checkIfBookMark(verseID: Int) -> Color {
        if let x = cSelectSurah {
            if x.bookmark == verseID {
                // rgb(22, 160, 133)
                return Color(.sRGB, red: 22/255, green: 160/255, blue: 133/255)
            } else {
                return .primary
            }
        }
        return .primary
    }
    
    // MARK: - Additional Function to check for system fonts
    private func checkFonts(){
        for family: String in UIFont.familyNames{
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
    
}
