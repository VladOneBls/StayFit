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
                          exercises: ["1", "2", "3"]),
            WorkoutModel(name: "LEGS ON FIRE",
                          picture: "",
                          exercises: ["4", "5", "6"]),
            WorkoutModel(name: "STRONGER MUSCLES",
                          picture: "",
                          exercises: ["7", "8", "9"]),
            WorkoutModel(name: "TONING",
                          picture: "",
                          exercises: ["10", "11", "12"]),
            WorkoutModel(name: "BUTT & THIGHS",
                          picture: "",
                          exercises: ["13", "14", "15"])
        ]
        
        workout.append(contentsOf: newWorkout)
    }
}
    




