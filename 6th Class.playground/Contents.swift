import Foundation

//closures
//Funciones son casos especiales de funciones
//Un closure es una función sin nombre.
//paréntesis para las funciones son para llamar pero esperando un resultado

let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]
//
//func isAscending(_ i: Int, _ j: Int) -> Bool {
//    return i < j
//}

//let volunteerSorted = volunteerCounts.sorted(by: isAscending)

//Se puede declarar en la misma función, haciendo un closure:
//Hace más compacto el código

//let volunteerSorted = volunteerCounts.sorted(by: {(i: Int, j: Int) ->
//    Bool in
//    i < j
//})

//Más simplificado aún:
//let volunteerSorted = volunteerCounts.sorted(by: {i, j in i < j })


//Aún más
//let volunteerSorted = volunteerCounts.sorted {$0 < $1}
//
//print(volunteerSorted)

//----------------

//func doawesomework(on input: String,
//                   using transformer: () -> Void,
//                   then completion:() -> Void){
//    //Here would go the logic to do the awesome work
//}
//
//doawesomework(on: "Diplomado"){
//    //Here goes the transformer
//} then: {
//    //Here goes the completion
//}

//----------------

let volunteerAverages = [10.75, 4.2, 1.5, 12.12, 16.815]

func format(numbers: Double,
using formatter: (Double) -> String = {"\($0)"}) -> [String]{
    var result = [String]()
    
    for number in numbers {
        let transformedNumber = formatter(number)
        result.append(transformedNumber)
    }
    
    return result
}

func rounder(_ number: Double) -> String{
    let roundedNumber: Int = Int(number)
    return "\(roundedNumber)"
}

let formatterAverageVolunteers = format(numbers: volunteerAverages, using: rounder)

//print(volunteerAverages)
//print(formatterAverageVolunteers)

let averageVolunteersDescription = format(numbers: volunteerAverages, using: addDescription)

let defaultVolunteerFormat = format(numbers: volunteerAverges)

print(defaultVolunteerFormat)

//---------- MAP
// toma el clousure uno a uno

let roundedVolunteers = volunteerAverages.map {number in
    let roundedNumber = Int(number)
    return "\(roundedNumber)"
}

print(roundedVolunteers)

//filter

let passingVolunteers = roundedVolunteers.filter { number in
    return number > 10
}

print(passingVolunteers)

//reduce

let totalVolunteers = passingVolunteers.reduce(0){
    partialResult, number in
    return partialResult + number
}

print(totalVolunteers)

let finalVolunteerDescription = passingVolunteers.reduce("The volunteers were "){ partialResult, number in
    return partialResult + "\(number)"
}
