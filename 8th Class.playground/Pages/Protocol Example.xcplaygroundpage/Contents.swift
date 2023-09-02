//: [Previous](@previous)

import Foundation

//Otro ejemplo de protocolos

protocol Student: CustomStringConvertible {
    var accountNumber: Int { get }
    var name: String { get }
    
}

struct EngineeringStudent: Student {
    var accountNumber: Int
    var name: String
    let hasCalculator: Bool
    var description: String{
        "Engineering Student \(name)"
    }
}

struct MedicineStudent: Student {
    var accountNumber: Int
    var name: String
    let hasLabCoat: Bool
    var description: String{
        "Medicine Student \(name)"
    }
}

let engineeringStudent = EngineeringStudent(accountNumber: 312088796, name: "alex", hasCalculator: false)

let medicineStudent = MedicineStudent(accountNumber: 312088795, name: "weird dude", hasLabCoat: true)

//se usa el protocol student para generalizar en todas las carreras.
func printStudentsInformation(_ student: Student){
    //... funcs()
    print("\(student.name) - \(student.accountNumber)")
    
    //imprime únicamente si es ingeniero de medicina
    if let medicineStudent = student as? MedicineStudent{
        print(medicineStudent.hasLabCoat)
    }
}

printStudentsInformation(engineeringStudent)
printStudentsInformation(medicineStudent)

print(engineeringStudent)
print(medicineStudent)


//: [Next](@next)
