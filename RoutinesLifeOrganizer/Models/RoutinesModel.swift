//
//  RoutinesModel.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/8/20.
//

import Foundation
import SwiftUI

struct Model: Identifiable {
    let id: String = UUID().uuidString
    var routineGroups: [RoutineGroups] = [
        RoutineGroups(name: "Main", entries: [
            RoutineItem(name: "Rectangle", icon: "rectangle.fill"),
            RoutineItem(name: "Oval", icon: "circle.fill"),
            RoutineItem(name: "Group", icon: "rectangle.3.offgrid", children: [
                RoutineItem(name: "Rectangle", icon: "rectangle.fill"),
                RoutineItem(name: "Rectangle", icon: "rectangle.fill"),
                RoutineItem(name: "Rectangle", icon: "rectangle.fill")
            ]),
            RoutineItem(name: "Group", icon: "rectangle.3.offgrid", children: [
                RoutineItem(name: "Rectangle", icon: "rectangle.fill"),
                RoutineItem(name: "Rectangle", icon: "rectangle.fill"),
                RoutineItem(name: "Rectangle", icon: "rectangle.fill")
            ])
        ]),
        RoutineGroups(name: "Highlights", entries: [
            RoutineItem(name: "Triangle", icon: "triangle.fill"),
            RoutineItem(name: "Triangle", icon: "triangle.fill")
        ]),
        RoutineGroups(name: "Version 2", entries: [
            RoutineItem(name: "Rectangle", icon: "triangle.fill"),
            RoutineItem(name: "Oval", icon: "circle.fill"),
            RoutineItem(name: "Triangle", icon: "triangle.fill")
        ]),
    ]
}

struct RoutineGroups: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var icon: String? = ""
    var entries: [RoutineItem]
}

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
    var id: String = UUID().uuidString
    var name: String
    var icon: String
    var notes: String? = nil
    // A Double that represents the degree of completion for this routine.
    var progress: Double = 0.0
    var relatedRoutines: [RoutineItem]? = nil
    var children: [RoutineItem]?
    // The date of when the entry was last edited.
    var dateLastEdited: Date = Date()
    
}

extension RoutineItem {
    // Single examples
    static var dog = RoutineItem(name: "Walk the dog!", icon: "triangle.fill")
}
