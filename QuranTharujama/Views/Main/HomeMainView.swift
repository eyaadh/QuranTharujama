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
            VStack (alignment: .leading) {
                Text("Select your option to get started:")
                    .font(Font.custom("Optima Bold", size: 24))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                
                ScrollView{
                    LazyVStack (alignment: .leading) {
                        // MARK: - Body Content: Quran Translation
                        
                        HomeRowView(imageName: AppViewModel.TranslationData.image, heading: AppViewModel.TranslationData.module_name, subHeading: AppViewModel.TranslationData.languages)
                        
                        // MARK: - Body Content: Duas
                        HomeRowView(imageName: AppViewModel.DuasData.image, heading: AppViewModel.DuasData.module_name, subHeading: AppViewModel.DuasData.languages)
                    }.padding(.top, 10)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("﷽")
            
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
