//
//  SurahListView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI

struct SurahListView: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    
    
    var body: some View {
        ScrollView {
            ForEach(AppViewModel.translationData.records){surah in
                NavigationLink {
                    SurahDetailView()
                        .onAppear {
                            AppViewModel.beginReadingSurah(sIndex: (surah.id - 1))
                        }
                } label: {
                    ZStack {
                        GeometryReader { geo in
                            Rectangle()
                                .foregroundColor(surah.id % 2 == 0 ? .white: AppViewModel.bgOddCardColorSurah)
                                .frame(height: geo.size.height+10)
                                .cornerRadius(5)
                                .shadow(radius: 0.2)
                        }
                        LazyVStack (alignment: .trailing, spacing: 10) {
                            HStack{
                                VStack (alignment:.trailing, spacing: 10){
                                    Text("\(surah.name)")
                                        .font(Font.custom("me_quran", size: 20))
                                    Divider()
                                    Text("(\(surah.translation))")
                                        .font(Font.custom("Optima Bold", size: 18))
                                    Text("Number of Verses: \(String(surah.total_verses))")
                                        .font(Font.custom("Optima Regular", size: 12))
                                }
                                
                                ZStack{
                                    Image(systemName: "circle")
                                        .resizable()
                                        .frame(width: 42, height: 45)
                                    Text(String(surah.id))
                                        .font(Font.custom("KFGQPC Uthman Taha Naskh", size: 20))
                                }
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                
                            }
                        }
                    }.padding()
                }
                .accentColor(.black)
            }
        }
        .navigationTitle("Select \(AppViewModel.translationData.module_name)")
    }
}

struct SurahListView_Previews: PreviewProvider {
    static var previews: some View {
        SurahListView()
            .environmentObject(AppViewModel())
    }
}
