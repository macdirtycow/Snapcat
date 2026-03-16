import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to Snapcat!")
                .font(.largeTitle)
                .padding()
            Image("snapcat_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Capture and share the moments!")
                .font(.headline)
                .padding()        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}