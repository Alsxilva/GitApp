import Foundation

//-------Protocolos
//Relacionados con la encapsulación, en vez de tener variables globales.
//Podemos definir propiedades y métodos.
//Cuando un tipo cumple con el protocolo, lo conforma.

//Cómo aceptar de protocolos a funciones?

//let data = [
//    //Arreglo de arreglos
//    ["Eva", "30", "6"],
//    ["Saleh", "40", "18"],
//    ["Amit", "50", "20"]
//    //data.count nos arroja la cantidad de filas.
//]

//------- Protocolo
//Aquí definimos las propiedades que queremos que tengan los tipos
//Se definen los parámetros mínimos para conformar protocolo.
//La idea es encapsular elementos

protocol TabularDataSource{
    //Si quisiéramos agregar información se agregaría un set.
    
    //Cuántas filas y cuántas columnas
    var numberOPfRows: Int { get }
    var numberOfColumns: Int { get }
    
    //Qué hacer con ellas
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

//func printTable(_ data: [[String]], withColumnHeaders columnLabels: [String]){
//    var headerRow = "|"
//    var columnWidths = [Int]()
//
//    for columnLabel in columnLabels {
//        let columnHeader = "\(columnLabel) |"
//        headerRow += columnHeader
//        columnWidths.append(columnLabel.count)
//    }
//
//    print(headerRow)
//
//    for row in data {
//        // Start output string
//        //pipe al inicio
//        var output = "|"
//
//        //enumerates nos regresa una tupla: índice y elemento en el que vamos.
//        //row = ["name", "age", "age of experience"]
//        //for(0, "name")
//        for(index, item) in row.enumerated(){
//            let paddingNeeded = columnWidths[index] - item.count
//            let padding = repeatElement(" ", count:paddingNeeded).joined(separator: "")
//            output += "\(padding)\(item) |"
//        }
//
////        for item in row{
////            output += "\(item) |"
////        }
//
//        print(output)
//
//    }
//}

//Se puede DEBBUGGEAR con prints, pero hay otras técnicas de debbugeo como break.

struct Person{
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

//struct Department {
//    let name: String
//    var people = [Person]()
//
//    init(name: String){
//        self.name = name
//    }
//
//    //Método para agregar a más personas
//    mutating func add(_ person: Person){
//        people.append(person)
//    }
//
//}

//------- Protocolo conformado:
//
//struct Department: TabularDataSource {
//
//    //Definir las propiedades que nos pide el protocolo para ser TabularDataSource
//
//
//    let name: String
//    var people = [Person]()
//
//    init(name: String){
//        self.name = name
//    }
//
//    //Método para agregar a más personas
//    mutating func add(_ person: Person){
//        people.append(person)
//    }
//
//    //se puede quitar el return al ser una sola línea
//    var numberOPfRows: Int{ people.count }
//    var numberOfColumns: Int { 3 }
//
//    //    func label(forColumn column: Int) -> String {
//    //        switch column{
//    //        case 0:
//    //            return "Employee name"
//    //        case 1:
//    //            return "Age"
//    //        case 2:
//    //            return "Years of experience"
//    //
//    //        default: fatalError("Invalid column header index!")
//    //        }
//
//    func label(forColumn column: Int) -> String {
//        //Para no usar tantos returns
//        let columnHeader: String
//        switch column{
//        case 0:
//            columnHeader = "Employee name"
//        case 1:
//            columnHeader = "Age"
//        case 2:
//            columnHeader = "Years of experience"
//        default: fatalError("Invalid column header index!")
//        }
//        return columnHeader
//    }
//
//    func itemFor(row: Int, column: Int) -> String {
//        let person = people[row]
//
//        switch column{
//        case 0: return person.name
//        case 1: return String(person.age)
//        case 2: return String(person.yearsOfExperience)
//        default: fatalError("Invalid column for person!")
//        }
//    }
//}

//CustomStringConvertible
//print pregunta al tipo de dato cómo imprimir a consola.
//Se modifica del ejercicio anterior

struct Department: TabularDataSource, CustomStringConvertible {
    
    //Se define el protocolo y se tiene que agregar propiedad description (específico para este protocolo)
    
    //Definir las propiedades que nos pide el protocolo para ser TabularDataSource
    
    let name: String
    var people = [Person]()
    
    var description: String{
        return "Department: \(name)"
    }
    
    init(name: String){
        self.name = name
    }
    
    //Método para agregar a más personas
    mutating func add(_ person: Person){
        people.append(person)
    }
    
    //se puede quitar el return al ser una sola línea
    var numberOPfRows: Int{ people.count }
    var numberOfColumns: Int { 3 }
    
    //    func label(forColumn column: Int) -> String {
    //        switch column{
    //        case 0:
    //            return "Employee name"
    //        case 1:
    //            return "Age"
    //        case 2:
    //            return "Years of experience"
    //
    //        default: fatalError("Invalid column header index!")
    //        }
    
    func label(forColumn column: Int) -> String {
        //Para no usar tantos returns
        let columnHeader: String
        switch column{
        case 0:
            columnHeader = "Employee name"
        case 1:
            columnHeader = "Age"
        case 2:
            columnHeader = "Years of experience"
        default: fatalError("Invalid column header index!")
        }
        return columnHeader
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        
        switch column{
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column for person!")
        }
    }
}


//------- Para adaptarlo al protocolo

func printTable(_ dataSource: TabularDataSource){
    var headerRow = "|"
    var columnWidths = [Int]()
    
    for index in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: index)
        let columnHeader = "\(columnLabel) |"
        headerRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    
    print(headerRow)
    
    for index in 0..<dataSource.numberOPfRows {
        // Start output string
        //pipe al inicio
        var output = "|"
        
        //enumerates nos regresa una tupla: índice y elemento en el que vamos.
        //row = ["name", "age", "age of experience"]
        //for(0, "name")
        for columnIndex in 0..<dataSource.numberOfColumns{
            let item = dataSource.itemFor(row: index, column: columnIndex)
            let paddingNeeded = columnWidths[columnIndex] - item.count
            let padding = repeatElement(" ", count:paddingNeeded).joined(separator: "")
            output += "\(padding)\(item) |"
        }
        
//        for item in row{
//            output += "\(item) |"
//        }
        
        print(output)
        
    }
}

//printTable(data, withColumnHeaders: ["Employee name", "Age", "Years of Experience"])

//Nos permite utilizar distintos tipos que conformen protocolo

var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(department)

print(department)

//Casting

//let operationsDataSource: TabularDataSource = Department(name: "Other department")
//let engineeringDataSource = department as TabularDataSource

//Sintaxis generalmente usada.
//También se heredan protocolos desde clase padre.
//Protocolos soportan herencia, se indica con ":" después de declarar protocolo.
//class ClassName: ProtocolOne, ProtocolTwo{
//    //...
//}
//
//class ClassName: SuperClass, ProtocolOne, ProtocolTwo{
//    //...
//}
