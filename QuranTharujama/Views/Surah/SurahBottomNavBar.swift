//
//  SurahBottomNavBar.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 9-4-22.
//

import SwiftUI

struct SurahBottomNavBar: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    var ScrollIndex:ScrollViewProxy
    
    var body: some View {
        if AppViewModel.isNextSurahAvailable() && AppViewModel.isPreviousSurahAvailable() {
            ZStack {
                SurahBottomNavBarRectangle()
                HStack {
                    Spacer()
                    SurahBottomNavBarPrevButton(ScrollIndex: ScrollIndex)
                    Spacer()
                    Divider()
                    Spacer()
                    SurahBottomNavBarNextButton(ScrollIndex: ScrollIndex)
                    Spacer()
                }
            }
        } else if AppViewModel.isPreviousSurahAvailable() {
            ZStack {
                SurahBottomNavBarRectangle()
                HStack {
                    Spacer()
                    SurahBottomNavBarPrevButton(ScrollIndex: ScrollIndex)
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
                SurahBottomNavBarNextButton(ScrollIndex: ScrollIndex)
                
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
    var ScrollIndex:ScrollViewProxy
    
    var body: some View {
        Button {
            AppViewModel.advanceToNextSurah()
            withAnimation {
                ScrollIndex.scrollTo(AppViewModel.cSelectSurah?.bookmark ?? 1)
            }
        } label: {
            Text("Next")
            
            Image(systemName: "chevron.forward")
        }
        .foregroundColor(Color.white)
    }
}

struct SurahBottomNavBarPrevButton: View {
    @EnvironmentObject var AppViewModel: AppViewModel
    var ScrollIndex:ScrollViewProxy
    
    var body: some View {
        Button {
            AppViewModel.moveToPreviousSurah()
            withAnimation {
                ScrollIndex.scrollTo(AppViewModel.cSelectSurah?.bookmark ?? 1)
            }
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

