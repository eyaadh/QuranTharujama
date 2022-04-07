//
//  TharujamaRowView.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 8-4-22.
//

import SwiftUI

struct TharujamaRowView: View {
    var imageName:String = "quran"
    var heading:String = "Quran Translation"
    var subHeading:String = "English & Dhivehi"
    
    var body: some View {
        VStack (alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .aspectRatio(CGSize(width:100, height: 35), contentMode: .fit)
                    .shadow(radius: 3)
                
                HStack(alignment: .center){
                    Image(imageName)
                        .resizable()
                        .frame(width: 110, height: 110)
                    
                    VStack(alignment: .leading){
                        Text(heading)
                            .font(Font.custom("Optima Bold", size: 28))
                        HStack{
                            Image(systemName: "rectangle.and.text.magnifyingglass")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(subHeading)
                                .font(Font.custom("Optima Regular", size: 15))
                        }
                        .foregroundColor(.gray)
                        
                    }.padding(.horizontal, 20)
                    
                }.padding(.horizontal, 20)
            }
        }.padding(.horizontal, 20)
    }
}

struct TharujamaRowView_Previews: PreviewProvider {
    static var previews: some View {
        TharujamaRowView()
    }
}
