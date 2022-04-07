//
//  SurahListView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI

struct SurahListView: View {
    @EnvironmentObject var SurahViewMoel: SurahViewModel
    var body: some View {
        ScrollView {
            Text("بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")
                .padding()
            ForEach(SurahViewMoel.Surahs){surah in
                LazyVStack (alignment: .center) {
                    Text(surah.name)
                    Text(surah.translation)
                    Text(String(surah.total_verses))
                }.padding()
            }
        }
    }
}

struct SurahListView_Previews: PreviewProvider {
    static var previews: some View {
        SurahListView()
            .environmentObject(SurahViewModel())
    }
}
