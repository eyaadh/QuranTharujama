//
//  ContentView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI

struct TharujamaMainView: View {
    @EnvironmentObject var SurahViewMoel: SurahViewModel
    
    var body: some View {
        SurahListView()
    }
}

struct TPP: PreviewProvider {
    static var previews: some View {
        TharujamaMainView()
            .environmentObject(SurahViewModel())
    }
}
