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
        if AppViewModel.isNextSurahAvailable() && AppViewModel.isPreviousSurahAvailable() {
            ZStack {
                SurahBottomNavBarRectangle()
                HStack {
                    Spacer()
                    SurahBottomNavBarPrevButton()
                    Spacer()
                    Divider()
                    Spacer()
                    SurahBottomNavBarNextButton()
                    Spacer()
                }
            }
        } else if AppViewModel.isPreviousSurahAvailable() {
            ZStack {
                SurahBottomNavBarRectangle()
                HStack {
                    Spacer()
                    SurahBottomNavBarPrevButton()
                    Spacer()
                    Divider()
                    Spacer()
                    SurahBottomNavBarHomeButton()
                    Spacer()
                }
            }
        } else {
            ZStack {
                SurahBottomNavBarRectangle()
                HStack {
                    Spacer()
                    SurahBottomNavBarHomeButton()
                    Spacer()
                    Divider()
                    Spacer()
                    SurahBottomNavBarNextButton()
                    Spacer()
                }
                
            }
        }
        
    }
}

struct SurahBottomNavBarRectangle: View {
    var body: some View {
        Rectangle()
            .frame(height:48)
            .foregroundColor(Color.green)
            .cornerRadius(5)
    }
}

struct SurahBottomNavBarNextButton: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    
    var body: some View {
        Button {
            AppViewModel.advanceToNextSurah()
        } label: {
            Text("Next")
            
            Image(systemName: "chevron.forward")
        }
        .foregroundColor(Color.white)
    }
}

struct SurahBottomNavBarPrevButton: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    
    var body: some View {
        Button {
            AppViewModel.moveToPreviousSurah()
        } label: {
            Image(systemName: "chevron.backward")
            Text("Previous")
        }
        .foregroundColor(Color.white)
    }
}


struct SurahBottomNavBarHomeButton: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    
    var body: some View {
        Button {
            AppViewModel.cNavTag = nil
        } label: {
            Text("Home")
            
            Image(systemName: "house.fill")
        }
        .foregroundColor(Color.white)
    }
}

