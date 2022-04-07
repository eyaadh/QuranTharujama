//
//  ViewModels.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import Foundation

class SurahViewModel: ObservableObject {
    @Published var Surahs:[Surah] = [Surah]()
    
    init() {
        self.Surahs = DataService.getSurahData()
    }
}
