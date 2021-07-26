import Foundation

class WorkoutViewModel: ObservableObject {
    
    @Published var workout: [WorkoutModel] = []
    
    init() {
        getWorkout()
    }
    
    func getWorkout() {
        let newWorkout = [
            WorkoutModel(name: "WARM UP",
                          picture: "",
                          type: "cardio",
                          exercises: ["1", "2", "3"]),
            WorkoutModel(name: "LEGS ON FIRE",
                          picture: "",
                          type: "legs",
                          exercises: ["4", "5", "6"]),
            WorkoutModel(name: "STRONGER MUSCLES",
                          picture: "",
                          type: "arms",
                          exercises: ["7", "8", "9"]),
            WorkoutModel(name: "ABS KILLER",
                          picture: "",
                          type: "abs",
                          exercises: ["10", "11", "12"]),
            WorkoutModel(name: "BUTT & THIGHS",
                          picture: "",
                          type: "legs",
                          exercises: ["13", "14", "15"])
        ]
        
        workout.append(contentsOf: newWorkout)
    }
}
    




