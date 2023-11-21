import SwiftUI

struct ExerciseDetailView: View {
    
    @ObservedObject var exercise: Exercise
    
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
                   Text(exercise.name)
                   ColorPicker("Dificulté", selection: $exercise.dificulty)
               
           }
           .padding()
       }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: Exercise(name: "Test", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps","triceps" , "quadriceps"], dificulty: .green))
    }
}
