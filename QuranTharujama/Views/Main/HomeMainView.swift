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
                        NavigationLink(tag: 1, selection: $AppViewModel.cNavTag) {
                            SurahListView()
                        } label: {
                            HomeRowView(imageName: AppViewModel.translationData.image, heading: AppViewModel.translationData.module_name, subHeading: AppViewModel.translationData.languages)
                        }

                        
                        
                        // MARK: - Body Content: Duas
                        HomeRowView(imageName: AppViewModel.duasData.image, heading: AppViewModel.duasData.module_name, subHeading: AppViewModel.duasData.languages)
                    }.padding(.top, 10)
                }
                .accentColor(.black)
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
