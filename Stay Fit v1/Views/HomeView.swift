import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var quoteViewModel: QuoteViewModel
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Home")
                .navigationBarHidden(true)
            
            VStack {
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120.0, height: 120.0)
                    .shadow(radius: 20)
                    .padding(.top, 60)
                
                Image("appName")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300.0, height: 40.0)
                    .shadow(radius: 5)
                
                ForEach(quoteViewModel.quote) { qo in
                    if qo.day == "monday" { // change for specific day
                        // QUOTE
                        Text(qo.quote)
                            .foregroundColor(.black)
                            .font(.title2).italic()
                            .frame(width: 370, alignment: .center)
                            .padding(.top, 40)
                        
                        // AUTHOR
                        Text(qo.author)
                            .foregroundColor(.black)
                            .font(.title3).bold()
                            .padding()
                            .padding(.leading, 150)
                    }
                }
                
                
                Spacer()
                
                HStack {
                    // WORKOUTS BUTTON
                    NavigationLink(destination: WorkoutsView(), label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .foregroundColor(Color.black.opacity(0.5))
                                .frame(width: 170, height: 120)
                                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.black, lineWidth: 3.0))
                                .padding(.trailing, 5)
                            Text("Workouts")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    })
                    
                    // EXERCISES BUTTON
                    NavigationLink(destination: ExercisesView(), label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .foregroundColor(Color.black.opacity(0.5))
                                .frame(width: 170, height: 120)
                                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.black, lineWidth: 3.0))
                                .padding(.leading, 5)
                            Text("Exercises")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    })
                }
                
                // ACTIVITY BUTTON
                NavigationLink(destination: ActivityView(), label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color.black.opacity(0.8))
                            .frame(width: 360, height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.black, lineWidth: 3.0))
                            
                        Text("Activity")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 10)
                })
                
                // SIGN OUT BUTTON
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Sign Out")
                        .font(.callout)
                        .foregroundColor(.white)
                        .underline()
                        .padding(.top, 10)
                }.padding(.bottom, 50)
                
                
            }
        }.onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 161/255, green: 99/255, blue: 68/255))]
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(QuoteViewModel())
    }
}
