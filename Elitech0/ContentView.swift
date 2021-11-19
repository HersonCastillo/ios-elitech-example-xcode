import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var personName: String = ""
    @State private var personAge: String = ""
    @State var persons: [Person] = []
    @State private var reactVar: String = ""
    @State private var bindingInt: Int = 1
    
    var body: some View {
        VStack {
            if persons.count > 0 {
                NavigationView {
                    List(persons, id: \.id) {person in
                        NavigationLink(
                            destination: PersonDescriptor(
                                person: person,
                                reactVar: $reactVar
                            )
                        ) {
                            VStack(alignment: .leading) {
                                Text(person.name)
                                    .fontWeight(.bold)
                                Text("Edad \(person.age)")
                                    .italic()
                                    .underline()
                            }
                        }
                    }
                }.navigationBarTitle("Personas")
            } else {
                Text("No hay usuarios agregados.");
            }
            Spacer()
            VStack {
                TextField("Escribe cualquier cosa", text: $reactVar)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Text(reactVar)
                    .padding()
                Picker(selection: $bindingInt, label: Text("Picker Example"), content: {
                    Text("1").tag(1)
                    Text("2").tag(2)
                })
            }
            VStack {
                TextField("Nombre", text: $personName)
                    .disableAutocorrection(true)
                    .padding()
                TextField("Edad", text: $personAge)
                    .keyboardType(.numberPad)
                    .padding()
                Button(
                    action: {
                        let id = persons.count + 1
                        let current = Person(id: id, name: personName, age: Int(personAge) ?? 0)
                        persons.append(current)
                        personName = ""
                        personAge = ""
                        showAlert = true
                    },
                    label: {
                        Text("Agregar")
                    }
                )
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Bien hecho"),
                        message: Text("Usuario agregado exitosamente.")
                    )
                }
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
