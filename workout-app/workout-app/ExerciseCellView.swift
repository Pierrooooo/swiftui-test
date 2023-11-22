import SwiftUI

struct ExerciseCellView: View {
    
    @ObservedObject var exercise: Exercise
    
    let url = URL(string: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(exercise.dificulty)
            Text(exercise.name)
            Spacer()
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } placeholder: {
                Text("Image de l'exercice")
            }
        }
        .padding()
    }
}

struct ExerciseCellView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCellView(exercise: Exercise(name: "bidule", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps","triceps" , "quadriceps"], dificulty: .green))
    }
}
