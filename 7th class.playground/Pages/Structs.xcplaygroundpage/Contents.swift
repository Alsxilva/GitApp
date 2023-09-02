//: [Previous](@previous)

//Obvervadores: cachan cambios willSet & didSet
//Por default existen newValue & oldValue

//Self =! self

struct Dog{
    var isAdopted: Bool = true
    let color: String
    
    var name: String{
        willSet(newName){
            print("My new name is \(newName)")
        }
        
        didSet {
            print("My old name was \(oldValue)")
        }
    }
    
    static let amountOfPaws = 4
    var paws: Int = 4
    var specialNeeds: Bool{
        paws != Dog.amountOfPaws
    }
    
    //----- Funciones asignadas a un tipo
    
    func getID() -> String {
        return name + "\n" + "color: \(color)" + "\n" + "paws: \(paws)"
    }
    
    mutating func changeName(newName: String){
        name = newName
    }
    
    static func describeADog() -> String {
        "Dogs are really cute animals!"
    }
    
    //Únicamente en la declaración o en el init se pueden modificar o agregar parámetros y variables.
    //Es un inicializador aparte del inicializador default.
    
    init(name: String, isAdopted: Bool, color: String){
        self.name = name
        self.isAdopted = isAdopted
        self.color = color
    }
    //self: Se hace referencia a la instancia que está esperando, de parte de la instancia
    //Self: Hace referencia al tipo o alguna propiedad.
    //Se pueden tener varios inicializadores.
    
    init(adopted name: String, color: String){
        self.name = name
        self.isAdopted = true
        self.color = color
        
    }
    
    init(bought name: String, color: String){
        self.init(name: name, isAdopted : false, color: color)
    }
    
    //Hace referencia al primer init
    init(){
        self.init(adopted: "Milaneso", color: "Brown")
    }
}

//----- Variables estáticas
//----- Ahora podemnos inicializar un perrito así.
var anotherDog = Dog()

//var myDog = Dog(color:"Brown", name: "Milaneso")
var myDog = Dog(name:"Milaneso", isAdopted: true, color: "Brown")
myDog.isAdopted = false
myDog.name = "Dante"
myDog.paws = 3
myDog.specialNeeds
myDog.getID()
myDog.changeName(newName: "Solovino")

Dog.amountOfPaws
Dog.describeADog()
    
//var yourDog = Dog(adopted: <#T##String#>, color: <#T##String#>)

//----- Pide Strings que sí tenemos que poner seguramente: color y nombre

//var yourdog Dog

//:[Next](@next]
