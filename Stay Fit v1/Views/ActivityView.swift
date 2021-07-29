import SwiftUI

struct ActivityView: View {
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
            
            Text("To be developed...")
                .font(.title).bold()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
