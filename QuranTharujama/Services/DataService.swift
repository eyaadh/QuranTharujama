//
//  DataService.swift
//  QuranTharujama
//
//  Created by Ahmed Iyad on 7-4-22.
//

import Foundation

class DataService {
    static func getData() -> [AppData] {
        // create pathString
        let pathString = Bundle.main.path(forResource: "full_dataset", ofType: "json")
        
        // create URL from pathString
        guard pathString != nil else {
            return [AppData]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        // create the dataset from url
        do {
            let data = try Data(contentsOf: url)
            
            do {
                // decode the data
                let jsonDataSet = try JSONDecoder().decode([AppData].self, from: data)
                return jsonDataSet
            } catch {
                //error while decoding data
                print(error)
            }
        } catch {
            //error while trying to load data from url
            print(error)
        }
        return [AppData]()
    }
}