//
//  ExercisesView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 20/07/2021.
//

import SwiftUI

struct ExercisesView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                //.navigationTitle("Exercises")
            
            ScrollView {
                ForEach(exerciseViewModel.exercises) { ex in
                    NavigationLink(
                        destination: DetailedExerciseView(exerciseName: ex.name, steps: ex.steps, videoName: ex.videoName),
                        label: {
                        Text(ex.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 100, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(8)
                    }).padding(1)
                }
            }.offset(y: 110) // closing ScrollView
        } // close first ZStack
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView().environmentObject(ExerciseViewModel())
    }
}
