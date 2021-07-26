//
//  DetailedExerciseView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 20/07/2021.
//

import SwiftUI
import AVKit

struct DetailedExerciseView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    let exerciseName: String
    let steps: [String]
    let videoName: String
    
    var body: some View {
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoName, ofType: "mov")!))
        
        ZStack {
            Image("background").edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    VideoPlayer(player: player)
                        .frame(width: 390, height: 219)
                        .cornerRadius(10)
                        .onDisappear(){
                            player.pause()
                            player.seek(to: .zero)
                        }
                        //.disabled(true) // displays the video controls for 3 secs and then dissapear
                }
                
                Text(exerciseName)
                    .font(.largeTitle).bold()
                    .foregroundColor(.black)
                
                List {
                    ForEach(0..<steps.count) { index in
                        HStack (spacing: 15) {
                            Text("\(index+1)")
                                .font(.title2).bold()
                                .foregroundColor(.gray)
                            
                            Text(steps[index])
                                .foregroundColor(.black)
                                .padding(3)
                        }
                    }
                }
                
                .frame(width: 370, height: 400)
                .cornerRadius(10)
                
                NavigationLink(
                    destination: ExercisingSessionView(exerciseName: exerciseName),
                    label: {
                        Text("START")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 370, height: 50, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                            .padding(.bottom, 10)
                    })
            }
            .offset(y: 35)
            .edgesIgnoringSafeArea(.all)
            
        } // closing ZStack
    }
}

struct DetailedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedExerciseView(exerciseName: "Exercise Name", steps: ["1st exercise", "2nd exercise", "3rd exercise", "4th exercise", "5th exercise"], videoName: "burpees")
            .environmentObject(ExerciseViewModel())
    }
}
