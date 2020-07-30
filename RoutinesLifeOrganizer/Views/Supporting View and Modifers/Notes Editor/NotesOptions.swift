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
    @State private var showFreqPicker: Bool = true
    // Time
    @Binding var hasTime: Bool
    @Binding var timeOfOccurrence: Date
    @State private var showTimePicker: Bool = true
    
    // Add to Routine Group
    @Binding var selectedGroup: RoutineGroup
    @State private var selectedIndex: Int = 0
    @State private var showGroupChanger: Bool = false
    
    var formatter: DateFormatter {
        let format = DateFormatter()
        format.dateStyle = .full
        format.timeStyle = .short
        return format
    }
    
    var body: some View {
        Form {
            Section(header: Text("Set Reminders")) {
                // Time of Occurance?
                Toggle(isOn: $hasTime) {
                    Text("Remind me on a day")
                }
                if hasTime {
                    DisclosureGroup("\(formatter.string(from: timeOfOccurrence))", isExpanded: $showTimePicker) {
                        DatePicker("", selection: $timeOfOccurrence)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                    }
                }
            }
                Section {
                    // Frequency?
                    Toggle(isOn: $hasFreq) {
                        Text("Remind me at time")
                    }
                    if hasFreq {
                        DisclosureGroup("\(frequency.rawValue)", isExpanded: $showFreqPicker) {
                            Picker("Frequency", selection: $frequency) {
                                Text("Daily").tag(Frequency.Daily)
                                Text("Weekly").tag(Frequency.Weekly)
                                Text("Biweekly").tag(Frequency.Biweekly)
                                Text("Monthly").tag(Frequency.Monthly)
                                Text("Every 3 Months").tag(Frequency.Every3Months)
                                Text("Every 6 Months").tag(Frequency.Every6Months)
                                Text("Yearly").tag(Frequency.Yearly)
                            }.pickerStyle(WheelPickerStyle())
                            .labelsHidden()
                        }
                    }
                }
            
            Section(header: Text("Change Routine Group")) {
                DisclosureGroup("\(model.routineGroups[selectedIndex].name)", isExpanded: $showGroupChanger) {
                    Picker(selection: $selectedIndex, label: Text("Routine Group")) {
                        ForEach(0 ..< model.routineGroups.count) {
                            Text(model.routineGroups[$0].name)
                        }
                    }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
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
        
        NavigationView {
            NotesOptions(hasFreq: .constant(hasFreq), frequency: .constant(Frequency.Daily), hasTime: .constant(hasTime), timeOfOccurrence: .constant(timeOfOccurrence), selectedGroup: .constant(model.routineGroups[0])).environmentObject(model)
        }
    }
}
