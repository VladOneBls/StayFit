import SwiftUI

struct ExercisesView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Exercises")
            
            VStack {
                Image("background")
                    .frame(height: 110, alignment: .top)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    ForEach(exerciseViewModel.exercise) { ex in
                        NavigationLink(
                            destination: DetailedExerciseView(exerciseName: ex.name, steps: ex.steps, videoName: ex.videoName),
                            label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .frame(width: 370, height: 100)
                                        .foregroundColor(Color.black.opacity(0.4))
                                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.black, lineWidth: 2.0))
                                    
                                    Text(ex.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 340, height: 100, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                }
                            }).padding(1)
                    }
                }
                .padding(.bottom, 110)
            }
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView().environmentObject(ExerciseViewModel())
    }
}
