import SwiftUI
import AVKit

struct ExercisingSessionView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @ObservedObject var timerManager = TimerManager()
    
    let exerciseName: String
    let videoName: String
    
    @State var player : AVPlayer
    @State var isplaying = false
    @State var showcontrols = false
    
    init(exerciseName: String, videoName: String) {
        self.exerciseName = exerciseName
        self.videoName = videoName
        self._player = State(initialValue: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoName, ofType: "mov")!)))
    }
    
    var body: some View {
        VStack {
            CustomVideoPlayer(player: $player)
                .frame(width: 390, height: 219)
                .onTapGesture {
                    self.showcontrols = true
                }
            
            GeometryReader {_ in
                VStack {
                    Text(exerciseName)
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
                            self.player.pause()
                            self.player.seek(to: .zero)
                        }
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
                            self.player.pause()
                            player.isMuted = true
                            self.isplaying = false
                        }
                        else {
                            self.player.play()
                            player.isMuted = true
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
                    
                    // RESTART BUTTON
                    Button(action: {
                        self.timerManager.reset()
                        self.player.pause()
                        self.isplaying = false
                        self.player.seek(to: .zero)
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

struct CustomVideoPlayer : UIViewControllerRepresentable {
    
    @Binding var player: AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomVideoPlayer>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<CustomVideoPlayer>) {
        
    }
}

struct ExercisingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisingSessionView(exerciseName: "Squats", videoName: "squats")
    }
}
