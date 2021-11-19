//
//  FormGroup.swift
//  Elitech0
//
//  Created by Herson Castillo on 18/11/21.
//

import SwiftUI

struct FormGroup: View {
    @State private var personName: String
    @Binding var persons: [Person]
    
    var body: some View {
        TextField(
            "Nombre de la persona",
            text: $personName
        )
    }
}

struct FormGroup_Previews: PreviewProvider {
    static var previews: some View {
        FormGroup(personName: "", persons: [])
    }
}
