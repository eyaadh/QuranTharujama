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
            VStack (alignment: .leading) {
                Text("Select your option to get started:")
                    .font(Font.custom("Optima Bold", size: 24))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    
                ScrollView{
                    LazyVStack (alignment: .leading) {
                        TharujamaRowView(imageName: "quran", heading: "Quran Translation", subHeading: "English & Dhivehi")
                        TharujamaRowView(imageName: "dua", heading: "Daily Duas", subHeading: "English")
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("﷽")
            
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
