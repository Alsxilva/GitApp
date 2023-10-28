//
//  BandsTableViewModel.swift
//  Music Bands
//
//  Created by Diplomado on 28/10/23.
//

import Foundation

struct Rows {
    var title: String
    var description: String
}

class BandsTableViewModel {
    var rowsArray: [Rows] = []
    
    init(){
        rowsArray = [Rows(title: "Rüfüs Dü Sol", description: ""), Rows(title: "Radiohead", description: ""), Rows(title: "The Notorious B.I.G.", description: "")]
    }
    
    func getSections() -> Int {
        1
    }

    func getCountArray() -> Int {
        rowsArray.count
    }
    
    func getTitle(index: IndexPath) -> String {
        rowsArray[index.row].title
    }
    
    func getDescription(index: IndexPath) -> String {
        rowsArray[index.row].description
    }
    
    func getSectionTitle() -> String {
        "Favourite Worst Bands"
    }
}

