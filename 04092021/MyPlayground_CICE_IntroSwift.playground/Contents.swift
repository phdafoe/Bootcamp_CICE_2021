import UIKit

// -> Esto es un comentario en linea


/*
 -> Este es un comentario en grupo
 -> Esta es una prueba de ello
 */

// MARK: - TIPOS BASICOS

var nombre: String = "pepe" // var -> define una propiedad mutable
let apellido: String = "Ramirez" // let -> define una propiedad inmutable

nombre = "Felipe"
// apellido = "Ocampo"

let profesion = "iOS Developer"
print(profesion)

print("El Sr.\(nombre )" + " " + "\(apellido), es \(profesion)")

var numeroA = 4
var numeroB = 3.8

var multiplicacion = numeroA * Int(numeroB)

typealias EnteroAndres = Int

var numeroC: EnteroAndres = 5
multiplicacion = multiplicacion + numeroC

var numeroH = 1, numeroG = 4.9, numeroL = 5
print(numeroG)

// MARK: - OPERADORES
var numeroD = 0
numeroD = 2 * 5 + 7

numeroD += 1

numeroD -= 10

var sino = false

if sino{
    print("Correcto")
} else {
    print("Incorrecto")
}

if nombre.isEmpty || apellido.isEmpty {
    print("Coloca datos")
} else {
    print("Ya tienes datos")
}

if numeroD >= 7 {
    print("Correcto")
} else {
    print("Incorrecto")
}

var resultado = numeroD != 0 ? numeroA / Int(numeroB) : 0

print(resultado)

// MARK: - STRING - CHAARCTERS

var emptyString = ""
var anotherEmptyString = String()
var saludo = "Adios"

emptyString.isEmpty
saludo.isEmpty

var variableStringMutable = "Andres"
variableStringMutable += "Felipe"
variableStringMutable += "Ocampo"
variableStringMutable += "Eljaiek"

for item in saludo{
   print(item)
}


let exclamacion: Character = "!"
saludo += String(exclamacion)

var categoriaCaracteres: [Character] = ["c", "d", "r", "t"]
categoriaCaracteres.append("G")

var castStrin: String = String(categoriaCaracteres)

let animalesExoticos = "KOala _ ?, Ronoceronte; ?. Finguino ; __ ? DromedariusAlexiusgrgorus ?"
print("Animales exoticos \(animalesExoticos.count) characteres")

var bienvenidosaSwift = "Holaaa"
bienvenidosaSwift.insert("!", at: bienvenidosaSwift.endIndex)
bienvenidosaSwift.insert(contentsOf: "a vosotros ", at: bienvenidosaSwift.startIndex)


// MARK: - Arrays (Colecciones o matrices)

var iPhones = ["iPhone 4", "iPhone 5", "iPhone XR"]
var iPads = ["iPad Air", "iPad Mini"]

var dispositivos = iPhones + iPads

dispositivos.append("Mac Book Pro")
dispositivos.insert("WatchOS 24mm", at: 0)

dispositivos.sort(by: >)

let iPhone = dispositivos[2]

let lastPosition = dispositivos.last
let firstPosition = dispositivos.first

var aux = dispositivos.filter { $0.contains("iP") }
print(aux)


// MARK: - Diccionarios

var diccionarioVacio: [String: Any] = [:]
var otroDiccionario = Dictionary<String, Any>()

var coche = ["marca": "Mazda", "modelo": "Megane", "Potencia": "145 caballos"]
let marca = coche["marca"]

if coche["modelo"] != nil {
    print(coche["modelo"]!)
}

if let modelo = coche["modelo"] {
    print(modelo)
    print(marca ?? "")
}

for (clave,valor) in coche{
    print("Clave \(clave) y valor es \(valor)")
}

for clave in coche.keys{
    print(clave)
}

for valor in coche.values {
    print(valor)
}

// MARK: - Opcionales

var numeroEntero = 34
var numeroString = "3"

var sumaNUmeroEntStr = numeroEntero + Int(numeroString)!

var nuevaSuma: String = "\(sumaNUmeroEntStr)"

var nuevaSumaString: String = numeroString + nuevaSuma

var nombreAA: String? = "Andres"
nombreAA = "Felipe"

var nombreBB: String? = nil
var nombreModA: String!

if let nombreModADes = nombreModA{
    print(nombreModADes)
}


var xOptional: Int?
xOptional = 2
var nuevoOptional: String?
nuevoOptional = String(xOptional ?? 0)



// MARK: - Funciones
func miSerieFavorita() {
    print("Games of thrones")
}

miSerieFavorita()

func funcionRetornaString() -> String {
    "Hola Mundo !"
}

let auxFunc = funcionRetornaString()
print(auxFunc)


func funcionConAtributos(mensaje: String) {
    print(mensaje)
}

funcionConAtributos(mensaje: "Aqui Andres")

func numerosSecuencia(_ a: Int, _ b: Int, _ c: Int) -> Int {
    (a*b)+c
}

let auxNumero = numerosSecuencia(2, 6, 9)
print(auxNumero)
