import Foundation

struct ExerciseModel: Identifiable {
    
    let id: String = UUID().uuidString
    let name: String
    let logo: String
    let videoName: String
    let steps: [String]
    let targetMuscles: [String]
    
}
