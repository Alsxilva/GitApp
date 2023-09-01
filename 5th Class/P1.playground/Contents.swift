import UIKit

enum ContactMethod{ // Todos son métodos validos
    case email(String)
    case phone(Int)
    case mail(streetName: String, zipCode: String, stretNumber: Int)
}

var myPreferredContactMethod = ContactMethod.email("alex456@comunidad.unam.mx")

switch myPreferredContactMethod{
    case .email(let strEmail): print(strEmail)
    case .phone(let num): print(num)
    case .mail(streetName: let name, zipCode: let zc, stretNumber: let num): print("\(name),\(zc) \(num)")
}

//---------- Recursividad
// Operaciones:
enum ArithmeticExoression{
    case number(Int)
    indirect case addition(ArithmeticExoression,ArithmeticExoression) // Indirect para una llamada recursiva
    indirect case multiplication(ArithmeticExoression, ArithmeticExoression)
    indirect case subtraction(ArithmeticExoression, ArithmeticExoression)
    indirect case divide(ArithmeticExoression, ArithmeticExoression)
    
}

let eight = ArithmeticExoression.number(8)
let six = ArithmeticExoression.number(6)
let five = ArithmeticExoression.number(5)
let four = ArithmeticExoression.number(4)
let two = ArithmeticExoression.number(2)
let one = ArithmeticExoression.number(1)

let sum = ArithmeticExoression.addition(five, four)
let prduct = ArithmeticExoression.multiplication(four, ArithmeticExoression.number(4))

// print(prduct)


func evaluate(expression: ArithmeticExoression) -> Int{
    switch expression{
    case .number(let number): return number
    case .addition(let leftExpression, let rightExpression): return evaluate(expression: leftExpression) + evaluate(expression: rightExpression)
    case .multiplication(let leftExpression, let rightExpression): return evaluate(expression: leftExpression) * evaluate(expression: rightExpression)
    case .subtraction(let leftExpression, let rightExpression): return evaluate(expression: leftExpression) - evaluate(expression: rightExpression)
    case .divide(let leftExpression, let rightExpression): return evaluate(expression: leftExpression) / evaluate(expression: rightExpression)
        
    }
    
}


// Ejercicio
//let expression = ArithmeticExoression()

// (6+(4*(8-1))/2 = 17

print(evaluate(expression: prduct))


//-----------Estructuras
/*
    A diferencia de las clases, estos no se inicializan.
    Las clases sí.
 
    Referencias cambian valores.
    Copias no te da solidez.
 
    Se prefieren estructuras sobre clases.
    Clases únicamente en casos puntuales y bien planeados.
 */

class Car{         //Se inicializan
    var wheels: Int
    var color: String
    
    init(wheels: Int, color: String){
        self.wheels = wheels
        self.color = color
    }
}

let myCar = Car(wheels: 4, color: "Black")
myCar.color = "Blue"
let copyOfMyCar = myCar
copyOfMyCar.color = "Red"       //Ambas apuntan a la referencia del objeto.

copyOfMyCar.color


struct Dog{
    var name: String            //A pesar de ser var, no se puede modificar variable.
    var isAdopted: Bool         //Similar a let
    
}

var dante = Dog(name: "Dante", isAdopted: true)
dante.name = "Juan"
var danteClone = dante
danteClone.isAdopted = false
print(dante.isAdopted)
print(danteClone.isAdopted)

//------After break


class Vehicle{
    var wheels: Int?
    
    init(wheels: Int){
        self.wheels = wheels
    }
}

class Scooter: Vehicle {
    
    var color = String
    
    init(color: String = "Blue"){
        self.wheels = 2
        self.color = color
    }
    
}

let myVehicle = Scooter(wheels : 2)
