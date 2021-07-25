//
//  HomeView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 20/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("")
            
            VStack {
                // QUOTE
                Text("Our bodies communicate to us clearly and specifically, if we are willing to listen to them")
                    .foregroundColor(.black)
                    .font(.title2)
                    .padding(.horizontal, 30)
                    .padding(.top, 40)
                
                // AUTHOR
                Text("- Shakti Gawain")
                    .foregroundColor(.black)
                    .font(.title2).bold()
                    .padding()
                    .padding(.leading, 200)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: WorkoutsView(), label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 170, height: 170, alignment: .center)
                                .cornerRadius(10)
                            Text("Workouts")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    })
                    
                    NavigationLink(destination: ExercisesView(), label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 170, height: 170, alignment: .center)
                                .cornerRadius(10)
                            Text("Exercises")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    })
                }
                
                // SIGN OUT BUTTON
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Sign Out")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 35, alignment: .center)
                        .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                        .cornerRadius(5)
                        .padding(.top, 30)
                }
                
                Spacer()
            }
        }.onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 161/255, green: 99/255, blue: 68/255))]
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
