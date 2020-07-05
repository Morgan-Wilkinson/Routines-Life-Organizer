//
//  RoutineLeader.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/4/20.
//

import Foundation
import SwiftUI


/// RoutineLeader is a leader struct that can hold an overaching collection of a variety of RountineItems as entries. It is akin to a folder in terms of data structuring. 
struct RoutineLeader: Identifiable {
    var id: UUID = UUID()
    var name: String
    // A Double that tracks the degree of completion for this category of
    // routines. It is dependant on the childrens degree of completness.
    var progress: Double
    var children: [RoutineItem] = []
    
    init(name: String, progress: Double) {
        self.name = name
        self.progress = progress
    }
    
    mutating func updateProgress() {
        if !children.isEmpty {
            var newProgress = 0.0
            
            for child in children {
                newProgress = child.progress
            }
            
            progress = newProgress / Double(children.count)
        }
    }
}
