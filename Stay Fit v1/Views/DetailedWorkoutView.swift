import SwiftUI

struct DetailedWorkoutView: View {
    
    @EnvironmentObject var workoutViewModel: WorkoutViewModel
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    let workoutName: String
    let workoutExercises: [String]
    
    @State var currentTab = 0
    
    var body: some View {
        ZStack {
            Image("background")
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 390, height: 150, alignment: .center)
                        .foregroundColor(.white)
                    
                    Text(workoutName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 360, height: 30, alignment: .leading)
                        .offset(y: 50)
                }
                
                Spacer()
                
                ScrollView {
                    ForEach(workoutExercises.indices, id: \.self) { index in
                        HStack {
                            Image("logoLegDumbbellCurls")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100.0, height: 100.0)
                                .cornerRadius(5)
                                .padding(.leading, 25)
                            Text(self.workoutExercises[index])
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                            Spacer()
                        }
                    }.padding(.top, 10)
                }.offset(y: -5)
                
                Spacer()
                
                VStack {
                    // CATEGORY PICKER
                    Picker(selection: $currentTab, label: Text("")) {
                        Text("Beginner").tag(0)
                        Text("Intermediate").tag(1)
                        Text("Advanced").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                    
                    // START BUTTON
                    NavigationLink(
                        destination: WorkingOutSessionView(),
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
        DetailedWorkoutView(workoutName: "Workout Name", workoutExercises: ["LUNGES", "SQUATS", "BYCICLE CRUNCHES", "LEG RAISES"])
            .environmentObject(WorkoutViewModel())
            .environmentObject(ExerciseViewModel())
    }
}
