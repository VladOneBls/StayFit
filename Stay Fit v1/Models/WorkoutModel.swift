import Foundation

struct WorkoutModel: Identifiable {
    
    let id: String = UUID().uuidString
    let name: String
    let picture: String
    let type: String
    let exercises: [String]

    // ?? let targetMuscles: [String]
    
}