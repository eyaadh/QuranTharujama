//
//  DataService.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import Foundation

class DataService {
    static func getSurahData() -> [Surah] {
        // create pathString
        let pathString = Bundle.main.path(forResource: "quran_full_en_dv", ofType: "json")
        
        // create URL from pathString
        guard pathString != nil else {
            return [Surah]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        // create the dataset from url
        do {
            let data = try Data(contentsOf: url)
            
            do {
                // decode the data
                let jsonDataSet = try JSONDecoder().decode([Surah].self, from: data)
                return jsonDataSet
            } catch {
                //error while decoding data
                print(error)
            }
        } catch {
            //error while trying to load data from url
            print(error)
        }
        return [Surah]()
    }
}
