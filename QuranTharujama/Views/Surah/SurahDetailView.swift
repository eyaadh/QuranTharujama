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
                ForEach(0..<AppViewModel.cSelectSurah!.verses.count) { vIndex in
                    ZStack {
                        GeometryReader { geo in
                            // rgb(207, 216, 220)
                            Rectangle()
                                .foregroundColor(vIndex % 2 == 0 ? .white: AppViewModel.bgOddCardColor)
                                .frame(height: geo.size.height+10)
                                .shadow(radius: 0.5)
                        }
                        LazyVStack(alignment:.trailing, spacing: 10) {
                            HStack{
                                VStack(alignment:.trailing, spacing: 10){
                                    Text(AppViewModel.cSelectSurah!.verses[vIndex].text)
                                        .font(Font.custom("DecoType Naskh Regular", size: 15))
                                        .multilineTextAlignment(.trailing)
                                    Text(AppViewModel.cSelectSurah!.verses[vIndex].translation)
                                        .font(Font.custom("Optima Regular", size: 15))
                                        .multilineTextAlignment(.leading)
                                    Text(AppViewModel.cSelectSurah!.verses[vIndex].dv_translation)
                                        .font(Font.system(size: 15))
                                        .multilineTextAlignment(.trailing)
                                }
                                
                                ZStack{
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .frame(width: 42, height: 45)
                                    Text(String(AppViewModel.cSelectSurah!.verses[vIndex].id))
                                        .foregroundColor(.white)
                                        .font(Font.custom("Optima Bold", size: 20))
                                }
                                .padding(.horizontal, 20)
                                
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
