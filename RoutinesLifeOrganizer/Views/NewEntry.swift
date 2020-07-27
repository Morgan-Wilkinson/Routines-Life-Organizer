//
//  NewEntry.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/8/20.
//

import SwiftUI

struct NewEntry: View {
    @EnvironmentObject var model: Model
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
    
    // Frequency?
    @State private var hasDueDate = false
    @State private var frequencyPicker = Frequency.Daily
    
    // DueTime
    @State var hasTime: Bool = false
    @State var timeOfOccurrence: Date = Date()
    
    // RoutineGroup
    @Binding var routineGroup: RoutineGroup
    
    var body: some View {
        ZStack{
            RoutineItemBackground().edgesIgnoringSafeArea([.top, .leading, .trailing])
            
            VStack(alignment: .leading, spacing: 10.0) {
                EditNotes(notes: $notes, progress: $progress, showProgressUpdater: $showProgressUpdater, hasFreq: $hasDueDate, frequency: $frequencyPicker, hasTime: $hasTime, timeOfOccurrence: $timeOfOccurrence, routineGroup: $routineGroup).environmentObject(model)
            }
        }.navigationTitle(Text("New Entry"))
    }
}


struct NewEntry_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        return NavigationView {
            NewEntry(routineGroup: .constant(model.routineGroups[0]))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
