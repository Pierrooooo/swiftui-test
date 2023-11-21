import Foundation
import SwiftUI

class Exercise: ObservableObject, Identifiable {
    let id: UUID = UUID()
    @Published var name: String
    @Published var imageURL: String
    @Published var dificulty: Color
    @Published var muscles: [String]
    
    init(name: String, imageURL: String, muscles: [String], dificulty: Color) {
        self.name = name
        self.imageURL = imageURL
        self.muscles = muscles
        self.dificulty = dificulty
    }
}

class ExerciseArray: ObservableObject {
    @Published var exercises: [Exercise]
    
    init(exercises: [Exercise]) {
        self.exercises = exercises
    }
}
