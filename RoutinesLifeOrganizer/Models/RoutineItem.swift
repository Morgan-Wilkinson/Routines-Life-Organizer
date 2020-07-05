//
//  RoutineItem.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/4/20.
//

import Foundation
import SwiftUI

///
/// RoutineItem is a single instance of a Routine. This struct may be used in anywhere in the app as way to create a new entry of a routine/habit.
///
/// - parameter id: a unique identifier
/// - parameter name: a string that the routine will be identfied as to the user
/// - parameter notes: an optional string that the user may enter to explain the routine
/// - parameter progress: a Double that represents the degree of completion for this routine.
/// - parameter dateLastEdited: a Date that represents when this routine was last edited
///
struct RoutineItem: Identifiable {
    let id: UUID = UUID()
    var name: String
    var notes: String = "Placeholder. Click me to start adding notes!"
    // A Double that represents the degree of completion for this routine.
    var progress: Double = 0.0
    // The date of when the entry was last edited.
    var dateLastEdited: Date = Date()
    
    init(name: String) {
        self.name = name
    }
}

extension RoutineItem {
    // Single examples
    static var dog = RoutineItem(name: "Walk the dog!")
    //static let purchase = RoutineItem(name: "Buy the new headset!", notes: "When the headset is released later today, buy it!.", progress: 60.0, dateLastEdited: Date())
    //static let trash = RoutineItem(name: "Take out th trash!", notes: "Take out the trash before bed", progress: 55.0, dateLastEdited: Date())
    //static let gary = RoutineItem(name: "Ask Gary about the vacation.", notes: "Ask gary where we should go to vacation.", progress: 0.0, dateLastEdited: Date())
}

