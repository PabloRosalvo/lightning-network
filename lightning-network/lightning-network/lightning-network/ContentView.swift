import SwiftUI

struct ContentView: View {
    var window: UIWindow

    var body: some View {
        UIKitViewControllerWrapper()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(window: UIWindow())
    }
}
