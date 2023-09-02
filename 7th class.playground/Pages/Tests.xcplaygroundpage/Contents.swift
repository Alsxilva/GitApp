//: [Previous](@previous)

//Pruebas unitarias para probar comportamiento deseado.

import XCTest

//Framework para pruebas

class MyTests: XCTestCase {
    
    func getFullName(_ nameTuple: (String, String?, String, String?)) -> String {
        return nameTuple.0 + " " + (nameTuple.1 == nil || nameTuple.1 == "" ? "") + " " + nameTuple.2 + " " + (nameTuple.3 ?? "")
    }
    
    //Tiene que tener test en el nombre de la función.
    func test_GetFullName(){
        
        //given
        let firstPerson: (String, String?, String, String?) = (first: "Grecia", second: "Itzel", firstLastName: "Escárcega", secondLastName: "Maldonado")
        let secondPerson: (String, String?, String, String?) = (first: "Manuel", second: nil, firstLastName: "Pérez", secondLastName: nil)
        //let thirdPerson: (String, String?, String, String?) = (first: "Dante", second: "", firstLastName: "Sánchez", secondLastName: nil)
        
        //when
        let firstFullName = getFullName(firstPerson)
        let secondFullName = getFullName(secondPerson)
        //let thirdFullName = getFullName(thirdPerson)
        
        //then
        
        XCTAssertEqual(firstFullName, "Grecia Itzel Escárcega Maldonado")
        XCTAssertEqual(secondFullName, "Manuel Pérez")
        //XCTAssertEqual(thirdFullName, "Dante Sanchez")
    }
}

MyTests.defaultTestSuite.run()

//: [Next](@next)
