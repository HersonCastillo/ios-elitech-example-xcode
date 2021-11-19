import Foundation

class Person {
    let id: Int
    let name: String
    let age: Int
    
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    
    func greet() -> String {
        return "\(self.name), tienes \(self.age) años"
    }
}
