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
                            AppViewModel.beginReadingSurah(sIndex: surah.id)
                        }
                } label: {
                    ZStack {
                        GeometryReader { geo in
                            Rectangle()
                                .foregroundColor(surah.id % 2 == 0 ? .white: AppViewModel.bgOddCardColor)
                                .frame(height: geo.size.height+10)
                                .shadow(radius: 0.5)
                        }
                        LazyVStack (alignment: .leading) {
                            HStack{
                                ZStack{
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .frame(width: 42, height: 45)
                                    Text(String(surah.id))
                                        .foregroundColor(.white)
                                        .font(Font.custom("Optima Bold", size: 20))
                                }
                                .padding(.horizontal, 20)
                                
                                
                                VStack (alignment: .leading){
                                    Text("\(surah.name)")
                                        .font(Font.custom("DecoType Naskh Regular", size: 20))
                                    Text("(\(surah.translation))")
                                        .font(Font.custom("Optima Bold", size: 18))
                                    Text("Number of Verses: \(String(surah.total_verses))")
                                        .font(Font.custom("Optima Regular", size: 12))
                                }
                            }.padding(.horizontal)
                        }.padding()
                    }
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
