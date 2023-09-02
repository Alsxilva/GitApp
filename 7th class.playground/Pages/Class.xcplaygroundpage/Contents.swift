//: [Previous](@previous)

import Foundation

class Vehicle {
    var brand: String
    let model: String
    var owner: String?
    let serialNumber : String
    let wheels: Int?
    
    //------- variables computadas
    
    var type: String{
        //------- Operador nil coleassing: selecciona el nulo
        // Si wheels es nulo, elige uno u otro
        return (wheels ?? 0) > 0 ? "land" : "other"
    }
    
    //------- Tupla opcional
    var registration: (name: String, serialNumber: String, type: String)? {
        get {
            //únicamente se puede acceder al valor, pero no modificarlo
            //si no hay propietario, no hay registro
            if let owner = owner {
                return (owner, serialNumber, type)
            }
            return nil
        }
        
        //Cuando llega tupla se valida que exista
        set (newRegistration){
            //------- Comprueba que no sea nil
            if let newRegistration = newRegistration{
                //------- guarda name en owner, se cambia el nombre
                //------- del nuevo que está llegando se pasa el nombre
                owner = newRegistration.name
            }
        }
    }
    
    //Inicializador designado. Teienen que estar las propiedades
    init(brand: String, model: String, serialNumber: String, wheels: Int?){
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
        self.wheels = wheels
    }
    
    //------- métodos de instancia y métodos de tipo
    
    //------- Métodos de instancia
    //únicamente se ejecutan si la instancia ya está creada.
    
    // en estructuras MUTATING???
    
    //private para hacer privada.
    
    var isMoving: Bool = false
    func move(){
        isMoving = true
    }
    func stop(){
        isMoving = false
    }
    
    //-------Métodos de clase
    
    static func describe(){
        print("a vehicle!")
    }
    
    //-------Método de instancia
    
    func makeNoise() -> String {"Noise"}
    
}

let myVehicle = Vehicle(brand: "Tesla", model: "S", serialNumber: "777", wheels: 7)

//------- Imaginemos que es un producto en una tienda y se va a commprar con registration

myVehicle.registration = (name: "Messi", serialNumber: "10", type: "player car")
myVehicle.isMoving
Vehicle.describe()

//-------Clase que hereda del tipo vehículo: todas las propiedades que tenga esta clase, serán las mismas que tendrá esta clase. Se pueden modificar o llamar a las orginales.
//El inicializador designado se asegura que tus propiedades designadas estén cuando se hace ese objeto.
//En herencia se tiene que asegurar que se tengan todos los elementos de la clase que se está heredando. Los dos inicializadores designados de cada uno se tienen que segurar que ambos estén completos. Incluso entre sub clases de las subclases se tienen que asegurar los inicializadores designados.

class Car: Vehicle{
    
    //Se deja por default que todos los autos tienen mayor a una llanta y se evita la comprobación del tipo de auto: línea 17
    override var type: String{
        return "Car"
    }
    
    var isElectric: Bool
    
    //Marca llamar a superinit porque únicamente se inicializó un parámetro de todos los restantes que se necesitan para crear uns instancia.
    init(electric: Bool){
        self.isElectric = electric
        //Llama al iniciador de la clase padre.
        super.init(brand: "Buggatti", model: "Expensive one but electric", serialNumber: "777", wheels: 7)
    }
    
    //Editar funciones de la clase: Sobreestructuras (Overide)
    //Puede modificar, completar o sobreescribir totalmente.
    
    override func makeNoise() -> String {
        "BRRRRRRRM"
    }
    
    //Se sobreescribe pero aún se tiene que llamar al de arriba
    override init(brand: String, model: String, serialNumber: String, wheels: Int?) {
        isElectric = brand == "Bugatti"
        super.init(brand: brand, model: model, serialNumber: serialNumber, wheels: 4)
    }
    
    //Primero nos aseguramos de nosotros y luego al designado de arriba.
    init(brand: String, model: String, serialNumber: String, isElectric: Bool) {
        self.isElectric = isElectric
        super.init(brand: brand, model: model, serialNumber: serialNumber, wheels: 4)
    }
//
////    //Llamamos al designado que elegimos.
    convenience init(susukiModel model: String, serialNumber: String, isElectric: Bool, boughtBy name: String) {
        self.init(brand: "Susuki", model: model, serialNumber: serialNumber, isElectric: isElectric)
        owner = name
    }
    //Sobreescribir marca para imprimir nueva marca y vieja marca.
    
}

let myCar = Car(electric: true)
myCar.isElectric
myCar.brand
myCar.makeNoise()
let yourCar = Car(brand: "Susuki", model: "Swift", serialNumber: "123123", wheels: 4)

//: [Next](@next)
