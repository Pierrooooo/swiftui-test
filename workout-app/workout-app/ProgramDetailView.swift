//
//  ProgramDetailView.swift
//  workout-app
//
//  Created by CAILLET Pierre on 22/11/2023.
//

import SwiftUI


struct ProgramDetailView: View {
    
    @ObservedObject var program: Program

    @State var isModifying = false
    @Environment(\.presentationMode) var presentationMode

    @State var programName: String = ""
    
    
    var body: some View {
            VStack {
                if isModifying == false {
                    Text(program.name)
                        .padding()
                    
                    Button {
                        isModifying = true
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
                
                if isModifying == true {
                    
                    VStack {
                        TextField("Nom programe", text: $programName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                    .padding()
                    
                    
                    Button {
                        program.name = programName
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Valider")
                    }
                }
            }
    }
}

struct ProgramDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramDetailView(program: Program(name: "Test 1", programExercises: [Exercise(name: "Test", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps", "triceps", "quadriceps"], dificulty: .green)]))
    }
}
