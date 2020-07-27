//
//  NotesOptions.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/26/20.
//

import SwiftUI

struct NotesOptions: View {
    @EnvironmentObject var model: Model
    // Frequency?
    @Binding var hasFreq: Bool
    @Binding var frequency: Frequency
    
    // Time
    @Binding var hasTime: Bool
    @Binding var timeOfOccurrence: Date
    
    // Add to Routine Group
    @Binding var selectedGroup: RoutineGroup
    @State private var selectedIndex: Int = 0
    var body: some View {
        Form {
            // Time of Occurance?
            Toggle(isOn: $hasTime) {
                Text("Remind me on a day")
            }
            if hasTime {
                DatePicker("Alarm", selection: $timeOfOccurrence)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                    
                // Frequency?
                Toggle(isOn: $hasFreq) {
                    Text("Remind me at time")
                }
                if hasFreq {
                    Picker("Frequency", selection: $frequency) {
                        Text("Daily").tag(Frequency.Daily)
                        Text("Weekly").tag(Frequency.Weekly)
                        Text("Biweekly").tag(Frequency.Biweekly)
                        Text("Monthly").tag(Frequency.Monthly)
                        Text("Every 3 Months").tag(Frequency.Every3Months)
                        Text("Every 6 Months").tag(Frequency.Every6Months)
                        Text("Yearly").tag(Frequency.Yearly)
                    }.labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                }
            }
            
            Picker("Add to Routine Group", selection: $selectedIndex) {
                ForEach(model.routineGroups) { group in
                    Text(group.name)
                }
            }
        }
    }
}

struct NotesOptions_Previews: PreviewProvider {
    static var previews: some View {
        let hasFreq = true
        let hasTime: Bool = true
        let timeOfOccurrence = Date()
        let model = Model()
        NotesOptions(hasFreq: .constant(hasFreq), frequency: .constant(Frequency.Daily), hasTime: .constant(hasTime), timeOfOccurrence: .constant(timeOfOccurrence), selectedGroup: .constant(model.routineGroups[0])).environmentObject(model)
    }
}
