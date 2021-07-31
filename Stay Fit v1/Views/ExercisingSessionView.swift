import SwiftUI
import AVKit

struct ExercisingSessionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @ObservedObject var timerManager = TimerManager()
    
    let exerciseName: String
    let videoName: String
    
    @State private var audioPlayer: AVAudioPlayer
    @State private var videoPlayer : AVPlayer
    @State private var isplaying = false
    @State private var showcontrols = false
    
    init(exerciseName: String, videoName: String) {
        self.exerciseName = exerciseName
        self.videoName = videoName
        self._videoPlayer = State(initialValue: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoName, ofType: "mov")!)))
        self._audioPlayer = State(initialValue: try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "audio", ofType: "mp3")!)))
    }
    
    var body: some View {
        VStack {
            ZStack {
                CustomVideoPlayer(player: $videoPlayer)
                    .frame(width: 390, height: 219)
                    .onTapGesture {
                        self.showcontrols = true
                    }
                    .onAppear(perform: {
                        self.videoPlayer.seek(to: CMTime(seconds: .zero + 2, preferredTimescale: 1))
                    })
                    .navigationBarHidden(true)
                
                // NAVIGATION BAR BACK BUTTON
                Button(action: {
                    self.audioPlayer.pause()
                    self.audioPlayer.currentTime = 0
                    self.videoPlayer.pause()
                    self.timerManager.countdownFinished = false
                    self.timerManager.reset()
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack (spacing: 4) {
                        Image(systemName: "chevron.backward")
                            .font(.title2)
                        Text("Back")
                    }.foregroundColor(.black)
                    .padding(.leading, 8)
                    .padding(.bottom, 151)
                    Spacer()
                })
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
                            self.audioPlayer.pause()
                            self.videoPlayer.pause()
                            self.videoPlayer.seek(to: CMTime(seconds: .zero + 2, preferredTimescale: 1))
                        }
                    })
                    
                    // PLAY/PAUSE BUTTON
                    Button(action: {
                        if timerManager.timerMode != .finished {
                            if self.timerManager.timerMode == .initial {
                                self.timerManager.setTimerLength(seconds: 20)
                            }
                            self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                        }
                        
                        if self.isplaying {
                            self.audioPlayer.pause()
                            self.videoPlayer.pause()
                            self.videoPlayer.isMuted = true
                            self.isplaying = false
                        }
                        else {
                            self.audioPlayer.play()
                            self.videoPlayer.play()
                            videoPlayer.isMuted = true
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
                        self.isplaying = false
                        self.audioPlayer.pause()
                        self.videoPlayer.pause()
                        self.videoPlayer.seek(to: CMTime(seconds: .zero + 2, preferredTimescale: 1))
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
