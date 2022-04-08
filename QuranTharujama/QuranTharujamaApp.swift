//
//  QuranTharujamaApp.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import SwiftUI

@main
struct QuranTharujamaApp: App {
    var body: some Scene {
        WindowGroup {
            HomeMainView()
                .environmentObject(AppViewModel())
        }
    }
}
