import SwiftUI
import AVKit

struct CustomVideoPlayer: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @ObservedObject var timerManager = TimerManager()
    
    let exerciseName: String
    
    @State var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "squats", ofType: "mov")!))
    @State var isplaying = false
    @State var showcontrols = false
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                VideoPlayer(player: $player)
                
            }.frame(width: 390, height: 219)
            .onTapGesture {
                
                self.showcontrols = true
            }
            
            GeometryReader {_ in
                
                VStack {
                    Text("Exercise Name")
                        .font(.largeTitle).bold()
                        .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                        .padding(1)
                        .frame(width: 390, alignment: .center) // extra to align the VStack to center
                    
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
                        if self.isplaying {
                            
                            self.player.pause()
                            //player.isMuted.toggle()
                            self.isplaying = false
                        }
                        else {
                            
                            self.player.play()
                            //player.isMuted.toggle()
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
                } // closing VStack in GeometryReader
                .offset(y: 35)
                .edgesIgnoringSafeArea(.all)
            }
        } // closing first VStack
    }
}

struct VideoPlayer : UIViewControllerRepresentable {
    
    @Binding var player: AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>) {
        
    }
}

class Host: UIHostingController<CustomVideoPlayer>{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

// PREVIEW
struct CustomVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        CustomVideoPlayer(exerciseName: "squats")
    }
}
