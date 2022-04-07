//
//  ContentView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI

struct TharujamaMainView: View {
    @EnvironmentObject var SurahViewMoel: SurahViewModel
    
    var body: some View {
        VStack {
            Text("بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")
                .font(Font.custom("DecoType Naskh Tegular", size: 15))
                .shadow(radius: 5)
                .padding()
            HStack{
                Text("Quran Translation")
                    .font(Font.custom("Optima Bold", size: 20))
                    .shadow(radius: 5)
                Spacer()
                Text("ترجمة القرآن")
                    .font(Font.custom("DecoType Naskh Tegular", size: 20))
                    .shadow(radius: 5)
            }.padding(.horizontal)
            SurahListView()
        }
        
    }
}

struct TPP: PreviewProvider {
    static var previews: some View {
        TharujamaMainView()
            .environmentObject(SurahViewModel())
    }
}
