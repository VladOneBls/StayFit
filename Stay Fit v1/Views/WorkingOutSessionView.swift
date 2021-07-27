import SwiftUI
import AVKit

struct WorkingOutSessionView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @EnvironmentObject var workoutViewModel: WorkoutViewModel
    @ObservedObject var timerManager = TimerManager()
    
    var exerciseTime = 20
    
    let exercisesNames: [String]
    let videoNames: [String]
    
    @State var customPlayer : AVPlayer
    @State var isplaying = false
    @State var showcontrols = false
    
    init(exercisesNames: [String], videoNames: [String]) {
        self.exercisesNames = exercisesNames
        self.videoNames = videoNames
        self._customPlayer = State(initialValue: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoNames[0], ofType: "mov")!)))
    }
    
    var body: some View {
        VStack {
            CustomVideoPlayer(player: $customPlayer)
                .frame(width: 390, height: 219)
                .onTapGesture {
                    self.showcontrols = true
                }
            
            GeometryReader {_ in
                VStack {
                    Text(exercisesNames[0])
                        .font(.largeTitle).bold()
                        .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                        .padding(1)
                        .frame(width: 390, alignment: .center)
                    
                    // COUNTDOWN TIMER
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
                    .onReceive(timerManager.$secondsLeft, perform: { _ in
                        // video stops and timer restarts when secondsLeft = 0
                        if timerManager.secondsLeft == 1 {
                            self.timerManager.reset()
                            self.isplaying = false
                            self.customPlayer.pause()
                            self.customPlayer.seek(to: .zero)
                        }
                    })
                    
                    // 3 BUTTONS
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
                            if timerManager.timerMode != .finished {
                                if self.timerManager.timerMode == .initial {
                                    self.timerManager.setTimerLength(seconds: 20) // Initializing SecondsLeft !!!!!!!!!!!!
                                }
                                self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                            }
                            
                            if self.isplaying {
                                self.customPlayer.pause()
                                customPlayer.isMuted = true
                                self.isplaying = false
                            }
                            else {
                                self.customPlayer.play()
                                customPlayer.isMuted = true
                                self.isplaying = true
                            }
                        }, label: {
                            Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                                .padding(.top, 3)
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
                        self.customPlayer.pause()
                        self.isplaying = false
                        self.customPlayer.seek(to: .zero)
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
                }.offset(y: 30)
            }
        }
        .offset(y: 35)
        .edgesIgnoringSafeArea(.all)
    }
}

struct WorkingOutSessionView_Previews: PreviewProvider {
    static var previews: some View {
        WorkingOutSessionView(exercisesNames:["LUNGES","SQUATS","BYCICLE CRUNCHES","LEG RAISES"],videoNames:["lunges","squats","bycicleCrunches","legRaises"])
            .environmentObject(WorkoutViewModel())
            .environmentObject(ExerciseViewModel())
    }
}
