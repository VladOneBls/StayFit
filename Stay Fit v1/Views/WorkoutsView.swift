import SwiftUI

struct WorkoutsView: View {
    
    @EnvironmentObject var workoutViewModel: WorkoutViewModel
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var currentTab = 0
    
    @State private var cardioWorkouts = ["WARM UP", "LEGS ON FIRE", "STRONGER MUSCLES", "TONING", "BUTT & THIGHS", "1", "2", "3"]
    @State private var absWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var legsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var armsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Workouts")
            
            ScrollView {
                switch currentTab {
                case 0: // CARDIO TAB
                    ForEach(workoutViewModel.workout) { wo in
                        if wo.type == "cardio" {
                            NavigationLink(destination: DetailedWorkoutView(), label: {
                                Text(wo.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 100, alignment: .center)
                                    .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                                    .cornerRadius(8)
                            }).padding(1)
                        }
                    }
                    
                case 1: // ABS TAB
                    ForEach(workoutViewModel.workout) { wo in
                        if wo.type == "abs" {
                            NavigationLink(destination: DetailedWorkoutView(), label: {
                                Text(wo.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 100, alignment: .center)
                                    .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                                    .cornerRadius(8)
                            }).padding(1)
                        }
                    }
                    
                case 2: // LEGS TAB
                    ForEach(workoutViewModel.workout) { wo in
                        if wo.type == "legs" {
                            NavigationLink(destination: DetailedWorkoutView(), label: {
                                Text(wo.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 100, alignment: .center)
                                    .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                                    .cornerRadius(8)
                            }).padding(1)
                        }
                    }
                    
                case 3: // ARMS TAB
                    ForEach(workoutViewModel.workout) { wo in
                        if wo.type == "arms" {
                            NavigationLink(destination: DetailedWorkoutView(), label: {
                                Text(wo.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 100, alignment: .center)
                                    .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                                    .cornerRadius(8)
                            }).padding(1)
                        }
                    }
                    
                default:
                    Text("ERROR")
                } // closing switch
            }.offset(y: 150) // closing ScrollView
            
            Picker(selection: $currentTab, label: Text("")) {
                Text("Cardio").tag(0)
                Text("Abs").tag(1)
                Text("Legs").tag(2)
                Text("Arms").tag(3)
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.top, -340)
            .padding(.horizontal, 20)
        } // closing first ZStack
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView().environmentObject(WorkoutViewModel())
    }
}
