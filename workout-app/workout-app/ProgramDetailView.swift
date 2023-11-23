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
    @State var programExercises: [Exercise] = []
    
    let exercisesDispo: [Exercise] = [Exercise(name: "Test", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps", "triceps", "quadriceps"], dificulty: .green), Exercise(name: "Test2", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps","triceps"], dificulty: .red)]
    
    var body: some View {
            VStack {
                if isModifying == false {
                    Text(program.name)
                        .padding()
                    
                    ForEach(program.programExercises) { programExo in 
                        Text(programExo.name)
                    }
                    
                    Button {
                        isModifying = true
                    } label: {
                        Image(systemName: "pencil")
                    }
                    .padding()
                }
                
                if isModifying == true {
                    
                    VStack {
                        TextField("Nom programe", text: $program.name)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        HStackLayout {
                            Text("Exercises")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        ForEach(exercisesDispo) { exoDispo in
                            VStack {
                                Button(action: {
                                    if programExercises.contains(where: { exo in exo.id == exoDispo.id }){
                                        programExercises.removeAll(where: { exo in exo.id == exoDispo.id })
                                    }
                                    else {
                                        programExercises.append(exoDispo)
                                        
                                    }
                                }) {
                                    Text(exoDispo.name)
                                    if programExercises.contains(where: { exo in exo.id == exoDispo.id }){
                                        
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                        
                                    }
                                }
                            }
                        }
                        .padding(2)
                    }
                    .padding()
                    
                    Button {
                        program.programExercises = programExercises
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
        ProgramDetailView(program: Program(name: "Proram 1", programExercises: [Exercise(name: "Exo1", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps", "triceps", "quadriceps"], dificulty: .green),Exercise(name: "Exo2", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps", "triceps"], dificulty: .red)]))
    }
}
