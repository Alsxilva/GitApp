import UIKit

var greeting = "Hello, playground"

//Se almacena para todas las clases un solo UserDefault
let defaults = UserDefaults.standard

//Guardar dato

defaults.set(5, forKey: "Entero")
defaults.setValue("String", forKey: "String")
defaults.setValue(["Uno", "Dos"], forKey: "Array")

//Recuperar un Valor

//defaults.object(forKey: "Entero")
let numero = defaults.object(forKey: "Entero")
//defaults.integer(forKey: "Entero")
let numeroDos = defaults.integer(forKey: "Entero")

defaults.integer(forKey: "String")
defaults.array(forKey: "Array")

numeroDos + 3

struct myStruct: Codable{
    var variableUno: String
    var variableDos: Int
}

let myArray = [myStruct(variableUno: "Uno", variableDos: 1), myStruct(variableUno: "Dos", variableDos: 2)]

//Guardar Dato
if let encodedData = try? JSONEncoder().encode(myArray){
    //Guarda Json con una clave específica
    defaults.set(encodedData, forKey: "myArrayKey")
}

if let savedData = defaults.data(forKey: "myArrayKey"),
    let decodedArray = try? JSONDecoder().decode([myStruct].self, from: savedData){
    print(decodedArray[0])
}else{
    //No se encotraron elementos o hubo error al decodificar
}
