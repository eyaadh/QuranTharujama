//
//  ContentView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI

struct TharujamaMainView: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("﷽")
                    .font(Font.custom("Optima Bold", size: 28))
                    .padding(.bottom, 30)
                    
                ScrollView{
                    LazyVStack (alignment: .leading) {
                        TharujamaRowView(imageName: "quran", heading: "Quran Translation", subHeading: "English & Dhivehi")
                        TharujamaRowView(imageName: "dua", heading: "Daily Duas", subHeading: "English")
                    }
                    .padding()
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}

struct TPP: PreviewProvider {
    static var previews: some View {
        TharujamaMainView()
            .environmentObject(AppViewModel())
    }
}
