import SwiftUI

struct DetailedWorkoutView: View {
    
    @State var workoutName = "WARM UP"
    
    @State var currentTab = 0
    
    @State private var workoutExercises = ["LUNGES", "SQUATS", "BIKE CRUNCHES", "LEG RAISES"]
    
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
                
                // CATEGORY PICKER
                Picker(selection: $currentTab, label: Text("")) {
                    Text("Beginner").tag(0)
                    Text("Intermediate").tag(1)
                    Text("Advanced").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.top, -365)
                .padding(.horizontal, 20)
                .offset(y: 365)
                
                ScrollView {
                    switch currentTab {
                    case 0:
                        ForEach(workoutExercises.indices, id: \.self) { index in
                            HStack {
                                Image("logoLegBumbbellCurls")
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
                        }.offset(y: 33)
                    case 1:
                        ForEach(workoutExercises.indices, id: \.self) { index in
                            HStack {
                                Image("logoSquats")
                                    .resizable()
                                    .frame(width: 100.0, height: 100.0)
                                    .cornerRadius(5)
                                    .padding(.leading, -122)
                                Text("Exercise name")
                                    .fontWeight(.bold)
                            }
                        }.offset(y: 33)
                    case 2:
                        ForEach(workoutExercises.indices, id: \.self) { index in
                            HStack {
                                Image("logoSquats")
                                    .resizable()
                                    .frame(width: 100.0, height: 100.0)
                                    .cornerRadius(5)
                                    .padding(.leading, -122)
                                Text("Exercise name")
                                    .fontWeight(.bold)
                            }
                        }.offset(y: 33)
                    default:
                        Text("ERROR")
                    } // closing switch
                    
                    NavigationLink(
                        destination: WorkingOutSessionView(),
                        label: {
                            Text("START")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 370, height: 50, alignment: .center)
                                .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                                .cornerRadius(5)
                                .padding(.top, 50)
                        }).padding(1)
                } // closing ScrollView
            } // closing first VStack
        } // closing first ZStack
    }
}

struct DetailedWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedWorkoutView()
    }
}
