//
//  SurahDetailView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 8-4-22.
//

import SwiftUI

struct SurahDetailView: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    @State var idGen:Int = 0
    
    var body: some View {
        if AppViewModel.cSelectSurah != nil {
            ScrollView{
                ScrollViewReader{ proxy in
                    VStack{
                        HStack{Spacer()}.id("top")
                        ForEach(AppViewModel.cSelectSurah!.verses) { verse in
                            ZStack {
                                GeometryReader { geo in
                                    Rectangle()
                                        .foregroundColor(verse.id % 2 == 0 ? .white: AppViewModel.bgOddCardColorVerse)
                                        .frame(height: geo.size.height+10)
                                        .shadow(radius: 0.5)
                                        .onAppear{
                                            idGen = verse.id + 1
                                        }
                                        .id(idGen)
                                }
                                LazyVStack(alignment:.trailing, spacing: 10) {
                                    HStack{
                                        VStack(alignment:.trailing, spacing: 10){
                                            Text(verse.text)
                                                .font(Font.custom("me_quran", size: 20))
                                                .multilineTextAlignment(.trailing)
                                            Divider()
                                            Text(verse.translation)
                                                .font(Font.custom("Optima Regular", size: 15))
                                                .multilineTextAlignment(.center)
                                            Divider()
                                            Text(verse.dv_translation)
                                                .font(Font.custom("Mv Elaaf Normal", size: 20))
                                                .multilineTextAlignment(.trailing)
                                        }
                                        Button {
                                            // the first bookmark process is to update the color settings
                                            // and any other as this is done from current Selected Surah
                                            AppViewModel.cSelectSurah?.bookmark = verse.id
                                            // this bookmark process is to update the bookmark on jsonDataSet
                                            // so that presists while navigating
                                            AppViewModel.translationData.records[AppViewModel.scIndex].bookmark = verse.id
                                            
                                            DataService.playAudio(
                                                file: String(format: "%03d", verse.id),
                                                directory: "audio/\(String(format: "%03d", AppViewModel.cSelectSurah!.id))")
                                            
                                        } label: {
                                            ZStack{
                                                
                                                Image(systemName: "circle")
                                                    .resizable()
                                                    .frame(width: 42, height: 45)
                                                Text(String(verse.id))
                                                    .font(Font.custom("KFGQPC Uthman Taha Naskh", size: 20))
                                                
                                            }
                                            .padding(.horizontal, 20)
                                            .foregroundColor(AppViewModel.checkIfBookMark(verseID: verse.id))
                                            
                                        }
                                        
                                    }
                                }
                                .padding()
                            }.padding(.bottom, 25)
                            
                            
                        }
                        SurahBottomNavBar(ScrollIndex: proxy)
                    }.padding()
                        .onAppear{
                            withAnimation {
                                proxy.scrollTo(AppViewModel.cSelectSurah?.bookmark ?? 1, anchor: .top)
                            }
                        }
                }
                
                
            }
            .navigationTitle(AppViewModel.cSelectSurah!.name)
        } else {
            Text("Nothing")
        }
        
        
    }
}

struct SurahDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SurahDetailView()
            .environmentObject(AppViewModel())
    }
}
