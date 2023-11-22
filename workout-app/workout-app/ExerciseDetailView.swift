import SwiftUI

struct ExerciseDetailView: View {
    
    @ObservedObject var exercise: Exercise
    
    @State var isModifying = false
    @Environment(\.presentationMode) var presentationMode
    
    @State var exerciseName: String = ""
    @State var exerciseImageURL: String = ""
    @State var exerciseDificulty: Color = Color.green
    @State var exerciseMuscles: String  = ""
    
    let url = URL(string: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
       
       var body: some View {
           VStack {
               AsyncImage(url: url) { image in
                   image
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: UIScreen.main.bounds.width, height: 200)
               } placeholder: {
                   Text("Image de l'exercice")
               }
               
               if isModifying == false {
                   Text(exercise.name)
                   Circle()
                       .frame(width: 20, height: 20)
                       .foregroundColor(exercise.dificulty)
                   HStack {
                       ForEach(exercise.muscles, id: \.self) { muscle in
                           Text(muscle)
                       }
                   }
                   .padding()
               
                   Button {
                       isModifying = true
                   } label: {
                       Image(systemName: "pencil")
                   }
               }
               
               if isModifying == true {
                   
                   TextField("Nom exercice", text: $exerciseName)
                       .textFieldStyle(RoundedBorderTextFieldStyle())

                   TextField("Image exercice", text: $exerciseImageURL)
                       .textFieldStyle(RoundedBorderTextFieldStyle())

                   ColorPicker("Dificulté", selection: $exerciseDificulty)

                   TextField("Muscles ciblés (a, b, c, ...)", text: $exerciseMuscles)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                   
                   let musclesArray = exerciseMuscles.components(separatedBy: ",")
                   
                   Button {
                       exercise.name = exerciseName
                       exercise.imageURL = exerciseImageURL
                       exercise.dificulty = exerciseDificulty
                       exercise.muscles = musclesArray
                       presentationMode.wrappedValue.dismiss()
                   } label: {
                       Text("Valider")
                   }
               }

           }
           .padding()
       }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExerciseDetailView(exercise: Exercise(name: "Test", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps","triceps" , "quadriceps"], dificulty: .green))
        }
    }
}
