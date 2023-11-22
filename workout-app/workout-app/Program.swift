import Foundation

class Program: ObservableObject, Identifiable {
    let id: UUID = UUID()
    @Published var name: String
    @Published var programExercises: [Exercise]
    
    init(name: String, programExercises: [Exercise]) {
        self.name = name
        self.programExercises = programExercises
    }
}

class ProgramArray: ObservableObject {
    @Published var programs: [Program]
    
    init(programs: [Program]) {
        self.programs = programs
    }
}
