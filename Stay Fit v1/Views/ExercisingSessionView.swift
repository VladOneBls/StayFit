import SwiftUI

struct ExercisingSessionView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @ObservedObject var timerManager = TimerManager()
    
    let exerciseName: String
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .frame(width: 390, height: 250)
            
            Text(exerciseName)
                .font(.largeTitle).bold()
                .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                .padding(1)
            
            ZStack {
                Circle()
                    .stroke(Color(red: 243/255, green: 189/255, blue: 126/255), lineWidth: 12)
                    .frame(width: 230, height: 230)
                
                if timerManager.timerMode == .finished {
                    Text("0")
                        .font(.system(size: 150))
                        .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                        .padding(.vertical, 60)
                }
                else {
                    Text("\(timerManager.secondsLeft)")
                        .font(.system(size: 150))
                        .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                        .padding(.vertical, 60)
                }
            }
            
            // PLAY/PAUSE BUTTON
            Button(action: {
                if timerManager.timerMode != .finished {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(seconds: 5)
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                }
            }, label: {
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                    .padding(.top, 3)
            })
            
            // RESTART BUTTON
            Button(action: {
                self.timerManager.reset()
            }, label: {
                HStack(spacing: 15) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                    Text("Restart")
                        .foregroundColor(.white).bold()
                }
                .padding()
                .background((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .cornerRadius(50)
                .padding(.top, 15)

            })
            
            Spacer()
        }
        .offset(y: 35)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExercisingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisingSessionView(exerciseName: "Exercise Name").environmentObject(ExerciseViewModel())
    }
}
