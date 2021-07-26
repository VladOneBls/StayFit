import SwiftUI

struct WorkingOutSessionView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    var exerciseTime = 20
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .frame(width: 380, height: 200)
                .cornerRadius(20)
            
            Text("ExerciseName")
                .font(.largeTitle).bold()
                .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
            
            ZStack {
                Circle()
                    .stroke(Color(red: 243/255, green: 189/255, blue: 126/255), lineWidth: 12)
                    .frame(width: 230, height: 230)
                
                Text("\(timerManager.secondsLeft)")
                    .font(.system(size: 150))
                    .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                    .padding(.vertical, 60)
            }
            
            HStack {
                // BACK BUTTON
                Button(action: {
                    // code
                }, label: {
                    Image(systemName: "lessthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
                
                // PLAY/PAUSE BUTTON
                Button(action: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(seconds: exerciseTime)
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                }, label: {
                    Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
                
                // FORWARD BUTTON
                Button(action: {
                    // code
                }, label: {
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
            }
            
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
            })
            
            Spacer()
        }
        .offset(y: 50)
        .edgesIgnoringSafeArea(.all)
    }
}

struct WorkingOutSessionView_Previews: PreviewProvider {
    static var previews: some View {
        WorkingOutSessionView()
    }
}
