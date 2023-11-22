import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    VStack(alignment: .center) {
                        NavigationLink() {
                            ExercisesView()
                        } label: {
                            Image(systemName: "dumbbell")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Exercises")
                        }
                        NavigationLink() {
                            ProgramsView()
                        } label: {
                            Image(systemName: "dumbbell")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Programs")
                        }
                    } . frame(height: . infinity)
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
