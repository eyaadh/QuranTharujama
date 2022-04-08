//
//  SurahBottomNavBar.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 9-4-22.
//

import SwiftUI

struct SurahBottomNavBar: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    var body: some View {
        // show only if there is a next surah available
        if AppViewModel.isNextSurahAvailable() && AppViewModel.isPreviousSurahAvailable() {
            ZStack {
                Rectangle()
                    .frame(height:48)
                    .foregroundColor(Color.green)
                    .cornerRadius(5)
                
                HStack {
                    Spacer()
                    Button {
                        AppViewModel.moveToPreviousSurah()
                    } label: {
                        Image(systemName: "chevron.backward")
                        Text("Previous")
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                    Divider()
                    Spacer()
                    Button {
                        AppViewModel.advanceToNextSurah()
                    } label: {
                        Text("Next")
                        Image(systemName: "chevron.forward")
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                }
            }
        } else if AppViewModel.isPreviousSurahAvailable() {
            ZStack {
                Rectangle()
                    .frame(height:48)
                    .foregroundColor(Color.green)
                    .cornerRadius(5)
                
                Button {
                    AppViewModel.moveToPreviousSurah()
                } label: {
                    Image(systemName: "chevron.backward")
                    Text("Previous")
                }
                .foregroundColor(Color.white)
            }
        } else {
            ZStack {
                Rectangle()
                    .frame(height:48)
                    .foregroundColor(Color.green)
                    .cornerRadius(5)
                
                Button {
                    AppViewModel.advanceToNextSurah()
                } label: {
                    Text("Next")
                    
                    Image(systemName: "chevron.forward")
                }
                .foregroundColor(Color.white)
                
                
            }
        }
        
    }
}

struct SurahBottomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        SurahBottomNavBar()
            .environmentObject(AppViewModel())
    }
}
