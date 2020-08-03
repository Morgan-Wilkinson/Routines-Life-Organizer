//
//  RoutinesModel.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/8/20.
//

import Foundation
import SwiftUI

class Model: Identifiable, ObservableObject {
    let id: String = UUID().uuidString
    @Published var routineGroups: [RoutineGroup] = [
        RoutineGroup(name: "Main", color: Color.gray, icon: "rectangle.3.offgrid", shape: 0, entries: [
            RoutineItem(name: "Rectangle", icon: "rectangle.fill"),
            RoutineItem(name: "Oval", icon: "circle.fill"),
            RoutineItem(name: "Group", icon: "rectangle.3.offgrid", subTasks: [
                SubTask(index: 0, description: "Color the fish red"),
                SubTask(index: 1, description: "Color the fish blue"),
                SubTask(index: 2, description: "Color the fish black")
            ]),
            RoutineItem(name: "Group", icon: "rectangle.3.offgrid", subTasks: [
                SubTask(index: 0, description: "Color the fish red"),
                SubTask(index: 1, description: "Color the fish blue"),
                SubTask(index: 2, description: "Color the fish black")
            ])
        ]),
        RoutineGroup(name: "Highlights", color: Color.red, icon: "rectangle.3.offgrid", shape: 0, entries: [
            RoutineItem(name: "Triangle", icon: "triangle.fill"),
            RoutineItem(name: "Triangle", icon: "triangle.fill")
        ]),
        RoutineGroup(name: "Version 2", color: Color.yellow, icon: "rectangle.3.offgrid", shape: 1, entries: [
            RoutineItem(name: "Rectangle", icon: "triangle.fill"),
            RoutineItem(name: "Oval", icon: "circle.fill"),
            RoutineItem(name: "Triangle", icon: "triangle.fill")
        ]),
    ]
}

struct RoutineGroup: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var color: Color
    var icon: String
    var shape: Int
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
    var subTasks: [SubTask]?
    // The date of when the entry was last edited.
    var dateLastEdited: Date = Date()
    
}

/// SubTask is a child of a RoutineItem. It describes the various steps that would need to be completed inorder to finish the RoutineItem.
struct SubTask: Identifiable {
    var id: String = UUID().uuidString
    var index: Int
    var description : String
}

extension RoutineItem {
    // Single examples
    static var dog = RoutineItem(name: "Walk the dog!", icon: "triangle.fill")
}
