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
    var children: [RoutineItem]? = nil
    
    init(name: String, children: [RoutineItem]? = nil) {
        self.name = name
        self.children = children
    }
}
