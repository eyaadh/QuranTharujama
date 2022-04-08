//
//  ViewModels.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import Foundation

class AppViewModel: ObservableObject {
    // MARK: - Globaly Shared Application Data
    var app_data = [AppData]()
    @Published var DuasData:Duas
    @Published var TranslationData:Translation
    
    
    init() {
        self.app_data = DataService.getData()
        
        self.DuasData = self.app_data[0].duas
        self.TranslationData = self.app_data[0].translation
    }
    
}
