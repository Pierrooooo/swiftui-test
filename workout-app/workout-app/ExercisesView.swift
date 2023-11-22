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
                Text("Exercises")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                ScrollView {
                    Text("Swipe left to delete")
                        .padding(.trailing, 20)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.mint)
                    ForEach(exercises) { exercise in
                        NavigationLink() {
                            ExerciseDetailView(exercise: exercise)
                        } label: {
                            ExerciseCellView(exercise: exercise)
                        }
                        Divider()
                    }.onDelete { indexSet in
                        exercises.remove(atOffsets: indexSet)
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
                .padding()
            }
        }
    
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExercisesView()
        }
    }
}
