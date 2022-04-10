//
//  ContentView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI

struct HomeMainView: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    
    var body: some View {
        // MARK: - Main Navigation
        NavigationView {
            SurahListView()
                .onAppear{
                    AppViewModel.filteredSurahList = AppViewModel.translationData.records
                }
            
        }
        .navigationViewStyle(.stack)
        
    }
}

struct HomeMainView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        HomeMainView()
            .environmentObject(AppViewModel())
    }
}
