import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10.0)
                .padding(.all, 50)
            
            Circle()
                .foregroundColor(.white)
                .offset(y: -331)
                .frame(width: 35, height: 35, alignment: .center)
            
            Image(systemName: "key.fill")
                .foregroundColor(Color(red: 243/255, green: 189/255, blue: 126/255))
                .offset(y: -321)
                .font(.largeTitle)
            
            VStack {
                
                Spacer()
                
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120.0, height: 120.0)
                    .shadow(radius: 20)
                    .padding(.top, 30)
                
                Image("appName")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300.0, height: 40.0)
                    .shadow(radius: 5)
                
                Text("Create account,              Sign Up to get started")
                    .foregroundColor(Color(red: 161/255, green: 99/255, blue: 68/255))
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                    .padding(.top, 30)
                
                Spacer()
                
                Group {
                    
                    TextField("Email", text: $email)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }.offset(y: 3)
                
                Group {
                    
                    // SIGN UP BUTTON
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                    }, label: {
                        Text("Create Account")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    }).offset(y: 5)
                    
                    Spacer()
                    
                    Text("Already a member?")
                        .foregroundColor(Color(red: 161/255, green: 99/255, blue: 68/255))
                        .font(.caption)
                    
                    // SIGN IN BUTTON
                    NavigationLink(destination: SignInView()) {
                        Text("Sign In")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 110, height: 20, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    }
                }
                
                Spacer()
                
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
