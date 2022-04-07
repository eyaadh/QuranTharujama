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
            ForEach(AppViewModel.TranslationData.records){surah in
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .frame(height: 100)
                        .padding()
                        .shadow(radius: 1.5)
                    
                    LazyVStack (alignment: .leading) {
                        HStack{
                            Image(systemName: "circle.grid.cross.fill")
                            Spacer()
                            VStack{
                                Text(surah.name)
                                    .font(Font.custom("DecoType Naskh Tegular", size: 25))
                                Text(surah.translation)
                                    .font(Font.custom("Optima Bold", size: 20))
                                Text("Number of Verses: \(String(surah.total_verses))")
                                .font(Font.custom("Optima Regular", size: 12))
                            }
                            Spacer()
                            Image(systemName: "circle.grid.cross.fill")
                        }.padding(.horizontal)
                    }.padding()
                }
            }
        }
    }
}

struct SurahListView_Previews: PreviewProvider {
    static var previews: some View {
        SurahListView()
            .environmentObject(AppViewModel())
    }
}
