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
                         exercisesNames: ["LUNGES", "SQUATS", "BICYCLE CRUNCHES", "LEG RAISES"],
                         exercisesLogos: ["logoLunges", "logoSquats", "logoBycicleCrunches", "logoLegRaises"],
                         videoNames: ["lunges", "squats", "bycicleCrunches", "legRaises"]
                         ),
            WorkoutModel(name: "MORNING CARDIO",
                         picture: "",
                         type: "cardio",
                         exercisesNames: ["JUMPING JACKS","BURPEES","STAR JUMPS","SKATER JUMPS", "QUICK FEET"],
                         exercisesLogos: ["logoJumpingJacks", "logoBurpees", "logoStarJumps", "logoSkaterJumps", "logoQuickFeet"],
                         videoNames: ["jumpingJacks", "burpees", "starJumps", "skaterJumps", "quickFeet"]
                         ),
            WorkoutModel(name: "LEGS ON FIRE",
                         picture: "",
                         type: "legs",
                         exercisesNames: ["SQUATS", "LUNGES", "SIDE-LYING LEG RAISES", "BUTT BRIDGE"],
                         exercisesLogos: ["logoSquats", "logoLunges", "logoSideLyingLegRaises", "logoButtBridge"],
                         videoNames: ["squats", "lunges", "sideLyingLegRaises", "buttBridge"]
                         ),
            WorkoutModel(name: "BUTT & THIGHS",
                         picture: "",
                         type: "legs",
                         exercisesNames: ["PRONE FLUTTER KICKS", "FROGGY GLUTE LIFTS", "GLUTE KICKBACK CROSSOVER", "SUMO SQUAT CALF RAISES WITH WALL"],
                         exercisesLogos: ["logoProneFlutterKicks", "logoFroggyGluteLifts", "logoGluteKickbackCrossover", "logoSumoSquatCalfRaisesWithWall"],
                         videoNames: ["proneFlutterKicks", "froggyGluteLifts", "gluteKickbackCrossover", "sumoSquatCalfRaisesWithWall"]
                         ),
            WorkoutModel(name: "STRONGER ARMS",
                         picture: "",
                         type: "arms",
                         exercisesNames: ["ARM SCISSORS", "TRICEPS DIPS", "MILITARY PUSH-UPS", "ARM CURLS CRUNCHS", "DOORWAY CURLS"],
                         exercisesLogos: ["logoArmScissors", "logoTricepsDips", "logoMilitaryPushUps", "logoArmCurlsCrunchs", "logoDoorwayCurls"],
                         videoNames: ["armScissors", "tricepsDips", "militaryPushUps", "armCurlsCrunches", "doorwayCurls"]
                         ),
            WorkoutModel(name: "UPPER BODY TONIFIER",
                         picture: "",
                         type: "arms",
                         exercisesNames: ["ARM CIRCLES", "PUNCHES", "LEG DUMBBELL CURLS", "HOVER PUSH-UPS", "STAR CRAWL"],
                         exercisesLogos: ["logoArmCircles", "logoPunches", "logoLegDumbbellCurls", "logoHoverPushUps", "logoStarCrawl"],
                         videoNames: ["armCircles", "punches", "legDumbbellCurls", "hoverPushUps", "starCrawls"]
                         ),
            WorkoutModel(name: "ABS KILLER",
                         picture: "",
                         type: "abs",
                         exercisesNames: ["LEG RAISES", "ABDOMINAL CRUNCHES", "HEEL TOUCHES", "SIDE CRUNCHES"],
                         exercisesLogos: ["logoLegRaises", "logoAbdominalCrunches", "logoHeelTouches", "logoSideCrunches"],
                         videoNames: ["legRaises", "abdominalCrunches", "heelTouches", "sideCrunches"]
                         ),
            WorkoutModel(name: "LEAN OBLIQUES",
                         picture: "",
                         type: "abs",
                         exercisesNames: ["MOUNTAIN CLIMBER", "RUSSIAN TWISTS", "SIDE-LYING LEG RAISES", "BICYCLE CRUNCHES", "PLANK"],
                         exercisesLogos: ["logoMountainClimber", "logoRussianTwists", "logoSideLyingLegRaises", "logoBycicleCrunches", "logoPlank"],
                         videoNames: ["mountainClimber", "russianTwists", "sideLyingLegRaises", "bycicleCrunches", "plank"]
                         )
        ]
        
        workout.append(contentsOf: newWorkout)
    }
}





