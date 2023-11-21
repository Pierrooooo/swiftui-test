//
//  ContentView.swift
//  workout-app
//
//  Created by CAILLET Pierre on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink() {
                    ExercisesView()
                } label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                    Link("View Our Terms of Service",
                         destination: URL(string: "ExercisesView")!)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
