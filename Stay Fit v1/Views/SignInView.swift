
import SwiftUI

struct SignInView: View {
    
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
                
                Text("Welcome,                              Sign in to continue")
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
                }.offset(y: 10)
                
                Group {
                    // SIGN IN BUTTON
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    }).offset(y: 12)
                    
                    Spacer()
                    
                    Text("Not a member?")
                        .foregroundColor(Color(red: 161/255, green: 99/255, blue: 68/255))
                        .font(.caption)
                        .offset(y: 10)
                    
                    // CREATE ACCOUNT BUTTON
                    NavigationLink(destination: SignUpView()) {
                        Text("Create account")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 110, height: 20, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    }.offset(y: 15)
                }
                // FORGOT YOUR PASSWORD BUTTON
                Button(action: {
                    
                    //TODO
                    
                }, label: {
                    Text("Forgot your password?")
                        .foregroundColor(.white)
                        .font(.caption)
                        .underline()
                }).offset(y: 30)
                
                Spacer()
                
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
