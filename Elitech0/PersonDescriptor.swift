import SwiftUI

struct PersonDescriptor: View {
    let person: Person
    @Binding var reactVar: String
    
    var body: some View {
        VStack {
            Text(person.greet())
                .bold()
            Spacer()
            Button(
                action: {
                    reactVar = "Este valor ha cambiado"
                },
                label: {
                    Text("Modificar valor de variable State")
                }
            )
            Text(reactVar)
                .padding()
        }
    }
}

struct PersonDescriptor_Previews: PreviewProvider {
    static var previews: some View {
        PersonDescriptor(
            person: Person(id: 1, name: "Prueba", age: 20),
            reactVar: .constant("Texto")
        )
    }
}
