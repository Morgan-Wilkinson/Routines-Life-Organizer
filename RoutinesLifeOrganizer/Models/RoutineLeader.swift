//
//  RoutineLeader.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/4/20.
//

import Foundation
import SwiftUI


/// RoutineLeader is a leader struct that can hold an overaching collection of a variety of RountineItems as entries. It is akin to a folder in terms of data structuring. 
struct RoutineLeader: Hashable, Identifiable {
    var id: Self {self}
    var name: String
    // A Double that tracks the degree of completion for this category of
    // routines. It is dependant on the childrens degree of completness.
    var progress: Double
    var children: [RoutineItem]? = nil
}

/*
 init(name: String, progress: Double) {
     self.name = name
     self.progress = progress
 }
 */

