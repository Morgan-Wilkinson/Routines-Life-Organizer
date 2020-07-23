//
//  NewEntry.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/8/20.
//

import SwiftUI

struct NewEntry: View {
    // Entry Editable Elements
    @State var name: String = ""
    @State var icon: String = ""
    
    // Notes
    @State var notes: String = ""
    @State private var showNotes = true
    
    // Progress
    // A Double that represents the degree of completion for this routine.
    @State var progress: Double = 0.0
    @State private var showProgressUpdater = false
    
    // Date picker
    @State var dateOfOccurrence: Date = Date()
    @State private var showDatePicker = false
    
    // Due Date?
    @State private var hasDueDate = false
    @State var dueDate: Date = Date()
    @State private var frequencyPicker = Frequency.Daily
    
    //@State var frequency: [String] = ["Daily", "Weekly", "Biweekly", "Monthly", "Every 3 Months", "Every 6 Months", "Yearly"]
    var body: some View {
        ZStack{
            RoutineItemBackground().edgesIgnoringSafeArea([.top, .leading, .trailing])
            
            VStack(alignment: .leading, spacing: 10.0) {
                EditNotes(notes: $notes, progress: $progress, showProgressUpdater: $showProgressUpdater, hasDueDate: $hasDueDate, dueDate: $dueDate, frequency: $frequencyPicker)
            }
        }.navigationTitle(Text("New Entry"))
    }
}


struct NewEntry_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationView {
            NewEntry()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
