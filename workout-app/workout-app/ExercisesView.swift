//
//  ContentView.swift
//  workout-app
//
//  Created by CAILLET Pierre on 20/11/2023.
//

import SwiftUI

struct ExercisesView: View {
    @State var exercises: [Exercise] = []
    @State var exerciseName: String = ""
    @State var exerciseImageURL: String = ""
    @State var exerciseDificulty: Color = Color.green
    @State var exerciseMuscles: String  = ""
    
    let musclesDispo = ["biceps","triceps" , "quadriceps"]
    

    var body: some View {
            
            VStack {
                List {
                    ForEach(exercises) { exercise in
                        NavigationLink() {
                            ExerciseDetailView(exercise: exercise)
                        } label: {
                            ExerciseCellView(exercise: exercise)
                        }
                    }
                }

                HStack {
                    VStack {
                        TextField("Nom exercice", text: $exerciseName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Image exercice", text: $exerciseImageURL)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        ColorPicker("Dificulté", selection: $exerciseDificulty)

                        TextField("Muscles ciblés (a, b, c, ...)", text: $exerciseMuscles)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Button(action: {
                        if !exerciseName.isEmpty && !exerciseMuscles.isEmpty {
                            let musclesArray = exerciseMuscles.components(separatedBy: ",")
                            let exercise = Exercise(name: exerciseName, imageURL: exerciseImageURL, muscles: musclesArray, dificulty: exerciseDificulty)
                            exercises.append(exercise)
                            exerciseName = ""
                            exerciseImageURL = ""
                            exerciseDificulty = Color.green
                            exerciseMuscles = ""
                        }
                    }) {
                        Text("Ajouter")
                    }
                }
            }
            .padding()
            .navigationTitle("Exercices")
        }
    
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExercisesView()
        }
    }
}
