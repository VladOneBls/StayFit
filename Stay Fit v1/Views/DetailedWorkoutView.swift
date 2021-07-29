import SwiftUI

struct DetailedWorkoutView: View {
    
    @EnvironmentObject var workoutViewModel: WorkoutViewModel
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    let workoutName: String
    let exercisesNames: [String]
    let exercisesLogos: [String]
    let videoNames: [String]
    
    @State var currentTab = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle(workoutName)
            
            VStack {
                // FUTURE WORKOUT PICTURE HERE
//                ZStack {
//                    Rectangle()
//                        .frame(width: 390, height: 150, alignment: .center)
//                        .foregroundColor(.white)
//
//                    Text(workoutName)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .frame(width: 360, height: 30, alignment: .leading)
//                        .offset(y: 50)
//                }
                Image("background")
                    .frame(height: 110, alignment: .top)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    ForEach(0..<exercisesNames.count) { index in
                        HStack {
                            Image(exercisesLogos[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100.0, height: 100.0)
                                .cornerRadius(5)
                                .padding(.leading, 25)
                            
                            Text(exercisesNames[index])
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }.padding(.top, 10)
                        .padding(.bottom, -5)
                    }
                }
                
                Spacer()
                
                VStack {
                    // CATEGORY PICKER
                    Picker(selection: $currentTab, label: Text("")) {
                        Text("Beginner").tag(1)
                        Text("Intermediate").tag(2)
                        Text("Advanced").tag(3)
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                    
                    // START BUTTON
                    NavigationLink(
                        destination: WorkingOutSessionView(exercisesNames: exercisesNames, videoNames: videoNames),
                        label: {
                            Text("START")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 50, alignment: .center)
                                .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                                .cornerRadius(15)
                        })
                }.padding(.bottom, 100)
            }
        }
    }
}

struct DetailedWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedWorkoutView(workoutName:"WARM UP",exercisesNames:["LUNGES","SQUATS","BYCICLE CRUNCHES","LEG RAISES"],exercisesLogos:["logoLunges","logoSquats","logoBycicleCrunches","logoLegRaises"],videoNames:["lunges","squats","bycicleCrunches","legRaises"])
            .environmentObject(WorkoutViewModel())
            .environmentObject(ExerciseViewModel())
    }
}
