//
//  SurahDetailView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 8-4-22.
//

import SwiftUI

struct SurahDetailView: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    
    var body: some View {
        if AppViewModel.cSelectSurah != nil {
            ScrollView{
                ForEach(AppViewModel.cSelectSurah!.verses) { verse in
                    ZStack {
                        GeometryReader { geo in
                            // rgb(207, 216, 220)
                            Rectangle()
                                .foregroundColor(verse.id % 2 == 0 ? .white: AppViewModel.bgOddCardColorVerse)
                                .frame(height: geo.size.height+10)
                                .shadow(radius: 0.5)
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
                                
                                ZStack{
                                    Image(systemName: "circle")
                                        .resizable()
                                        .frame(width: 42, height: 45)
                                    Text(String(verse.id))
                                        .font(Font.custom("KFGQPC Uthman Taha Naskh", size: 20))
                                }
                                .padding(.horizontal, 20)
                                .foregroundColor(.primary)
                                
                            }
                        }
                        .padding()
                    }
                    .padding()
                    
                    
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
