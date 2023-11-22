//
//  ProgramCellView.swift
//  workout-app
//
//  Created by CAILLET Pierre on 22/11/2023.
//

import SwiftUI

struct ProgramCellView: View {
    
    @ObservedObject var program: Program
    
    var body: some View {
        VStack {
            Text(program.name)
        }
    }
}

struct ProgramCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramCellView(program: Program(name: "Push", programExercises: [Exercise(name: "Test", imageURL: "https://plus.unsplash.com/premium_photo-1687201986043-ea20e8a3239e?q=80&w=4227&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", muscles: ["biceps", "triceps", "quadriceps"], dificulty: .green)]))
    }
}
