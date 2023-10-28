//
//  TableViewModel.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import Foundation

struct Rows {
    var title: String
    var description: String
}

class TableViewModel {
    var rowsArray: [Rows]
    
    init(){
        rowsArray = [Rows(title: "Leche", description: ""), Rows(title: "Pan", description: ""), Rows(title: "Garrafón", description: "")]
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
    
    func addRow(text: String){
        rowsArray.append(Rows(title: text, description: ""))
    }
    
    func deleteRow(index: IndexPath){
        rowsArray.remove(at: index.row)
        print("Compra Borrada.")
    }
    
    func getSections() -> Int {
        1
    }
    
    func getSectionTitle() -> String {
        "Shopping List"
    }

}
