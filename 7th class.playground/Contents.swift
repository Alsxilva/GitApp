import Foundation

//-----Propiedades computadas
// Estructuras no heredan

enum Pet: String{
    
    var type: String{
        switch self{
        case .dog, .cat, .mouse: return "mamífero"
        case .turtle: return "reptil"
        case .parrot: return "ave"
        }
    }
}

let myPet = Pet.dog.type
let myBird = Pet.parrot.type
