//: [Previous](@previous)

import Foundation

//Extensions
//Nos sirven para agregar propiedades
//Nos permite tener el código mejor ordenado

extension Double{
    var squared: Double{ return self * self}
}

let sideLength: Double = 12.5
let area = sideLength.squared

struct Car{
    let maker: String
    let model: String
    let year: Int
    
    var fuelLevel: Double{
        willSet{
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be betweeeen 0 and 1")
        }
    }
}

//Initializers
extension Car {
    init(maker: String, model: String){
        self.init(maker: maker,
                  model: model,
                  year: 2023,
                  fuelLevel: 1.0)
    }
}

    extension Car: CustomStringConvertible{
        var description: String{
            "\(maker) = -\(model)"
        }
    }

//Nested type
extension Car {
        enum Era{
            case vintage, classic, modern
        }
    var era: Era{
        switch year {
        case ...1990:
            return .vintage
        case 1991...2000:
            return .classic
        case 2001...:
            return .modern
        default: return .modern
        }
    }
}

// Add Method

extension Car {
    mutating func fillFuel(){
        fuelLevel = 1.0
    }
}
    
let firstCar = Car(maker: "Honda",
                   model: "Civic",
                   year: 2018,
                   fuelLevel: 1.0)

let secondCar = Car(maker: "Nissan",
                    model: "Sentra")

print(firstCar.fuelLevel)
firstCar.fillFuel()
print(firstCar.fuelLevel)

//print(area)

//: [Next](@next)
