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
///
struct RoutineItem: Identifiable {
    let id: UUID = UUID()
    var name: String
    var notes: String?
    // The date of when the entry was last edited.
    var dateLastEdited: Date
    
    init(name: String, notes: String? = nil, dateLastEdited: Date) {
        self.name = name
        self.notes = notes
        self.dateLastEdited = dateLastEdited
    }
}

