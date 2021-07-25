//
//  ExerciseModel.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 20/07/2021.
//

import Foundation

// Immutable Struct => in order to update a variable I should use a function in this struct
struct ExerciseModel: Identifiable {
    
    let id: String = UUID().uuidString
    let name: String
    let logo: String
    let picture: String
    let videoURL: String
    let steps: [String]
    let targetMuscles: [String]
    
}
