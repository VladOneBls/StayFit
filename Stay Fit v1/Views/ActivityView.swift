import SwiftUI

struct ActivityView: View {
    var body: some View {
        ZStack {
            Image("background")
            
            VStack {
                
                Text("Linear Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [(Color(red: 243/255, green: 189/255, blue: 126/255)), (Color(red: 161/255, green: 99/255, blue: 68/255))]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .padding()
                
                Text("Linear Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [(Color(.systemOrange)), (Color(red: 161/255, green: 99/255, blue: 68/255))]), startPoint: .leading, endPoint: .trailing), lineWidth: 3.0))
                    .padding()
                
                Text("Linear Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background((Color(red: 243/255, green: 189/255, blue: 126/255)))
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke((Color(red: 161/255, green: 99/255, blue: 68/255)), lineWidth: 3.0))
                    .padding()
                
                Text("Linear Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [(Color(.systemOrange)), (Color(red: 243/255, green: 189/255, blue: 126/255))]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .padding()
                
                Text("Linear Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [(Color(.systemOrange)), (Color(red: 243/255, green: 189/255, blue: 126/255)), (Color(red: 243/255, green: 189/255, blue: 126/255))]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .padding()
                
                Text("Radial Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(RadialGradient(gradient: Gradient(colors: [(Color(.systemOrange)), (Color(red: 243/255, green: 189/255, blue: 126/255))]), center: .center, startRadius: 5, endRadius: 150))
                    .clipShape(Capsule())
                    .padding()
                
                Text("Radial Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(RadialGradient(gradient: Gradient(colors: [(Color(red: 243/255, green: 189/255, blue: 126/255)), (Color(.systemOrange))]), center: .center, startRadius: 5, endRadius: 150))
                    .clipShape(Capsule())
                    .padding()
                
                Text("Linear Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [(Color(.systemOrange)), (Color(red: 161/255, green: 99/255, blue: 68/255))]), startPoint: .leading, endPoint: .trailing), lineWidth: 3.0))
                    .padding()
                
                Text("Linear Gradient")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [(Color(.systemOrange)), (Color(red: 161/255, green: 99/255, blue: 68/255))]), startPoint: .leading, endPoint: .trailing), lineWidth: 5.0))
                    .padding()
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
