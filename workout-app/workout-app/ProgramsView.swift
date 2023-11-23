import SwiftUI

struct ProgramsView: View {
    
    @State var programs: [Program] = []
    @State var programName: String = ""
    @State var programeExercises: [Exercise] = []
    
    let exercisesDispo: [Exercise] = [Exercise(name: "Test", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps", "triceps", "quadriceps"], dificulty: .green), Exercise(name: "Test2", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps","triceps"], dificulty: .red)]
    
    var body: some View {
        VStack {
            Text("Programs")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            ScrollView {
                
                Text("Swipe left to delete")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(.mint)
                
                List {
                    ForEach(programs) { program in
                        NavigationLink() {
                            ProgramDetailView(program: program)
                        } label: {
                            ProgramCellView(program: program)
                        }
                    }.onDelete { indexSet in
                        programs.remove(atOffsets: indexSet)
                    }
                }
            }
            
            
            HStack {
                VStack {
                    TextField("Nom programe", text: $programName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ForEach(exercisesDispo) { exoDispo in
                        VStack {
                            
                            Button(action: {
                                if programeExercises.contains(where: { exo in exo.id == exoDispo.id }){
                                    programeExercises.removeAll(where: { exo in exo.id == exoDispo.id })
                                }
                                else {
                                    programeExercises.append(exoDispo)
                                    
                                }
                            }) {
                                Text(exoDispo.name)
                                if programeExercises.contains(where: { exo in exo.id == exoDispo.id }){
                                    
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
                
            }
            
            Button(action: {
                if !programName.isEmpty && !programeExercises.isEmpty {
                    let program = Program(name: programName, programExercises: programeExercises)
                    programs.append(program)
                    programName = ""
                }
            }) {
                Text("Ajouter")
            }
        }
        .padding()
    }
}

struct ProgramsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProgramsView()
        }
    }
}
