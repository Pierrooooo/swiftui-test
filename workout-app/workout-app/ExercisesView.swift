//
//  ContentView.swift
//  workout-app
//
//  Created by CAILLET Pierre on 20/11/2023.
//

import SwiftUI

struct Exercise: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageURL: String
    let dificulty: Color
    let muscles: [String]
}

struct ExercisesView: View {
    @State private var exercises: [Exercise] = []
    @State private var exerciseName: String = ""
    @State private var exerciseImageURL: String = ""
    @State private var exerciseDificulty: Color = Color.green
    @State private var exerciseMuscles: String = ""
    
    let musclesDispo = ["biceps","triceps" , "quadriceps"]
    
    @State var testUrl: String = "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

    var body: some View {
        VStack {
            List {
                ForEach(exercises) { exercise in
                    let url = URL(string: testUrl)
                    HStack {
                        Text(exercise.name)
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(exercise.dificulty)
                        ForEach(exercise.muscles, id: \.self) { muscle in
                            Text(muscle)
                        }
                        Spacer()
                        Text(exercise.imageURL)
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            Text("Image de l'exercice")
                        }
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

                    Picker(selection: $exerciseMuscles, label: Text("Muscles")) {
                    ForEach(0 ..< musclesDispo.count) {
                       Text(self.musclesDispo[$0]).tag($0)
                         }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Button(action: {
                    if !exerciseName.isEmpty && !exerciseMuscles.isEmpty {
                        let musclesArray = exerciseMuscles.components(separatedBy: ",")
                        let exercise = Exercise(name: exerciseName, imageURL: exerciseImageURL, dificulty: exerciseDificulty, muscles: musclesArray)
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
        ExercisesView()
    }
}
