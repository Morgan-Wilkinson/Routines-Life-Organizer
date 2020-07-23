//
//  EditNotes.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/20/20.
//

import SwiftUI

struct EditNotes: View {
    @Binding var notes: String
    @Binding var progress: Double
    @Binding var showProgressUpdater: Bool
    // Due Date?
    @Binding var hasDueDate: Bool
    @Binding var dueDate: Date
    @Binding var frequency: Frequency
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 5)
            
            VStack(alignment: .leading) {
                // Buttons
                HStack {
                        Button("Cancel") {showProgressUpdater.toggle()}
                        Spacer()
                        Button("Save") {showProgressUpdater.toggle()}
                }.edgesIgnoringSafeArea([.bottom, .leading, .trailing])
                .padding([.top, .leading, .trailing])
                Divider()
                Spacer()
                
                // Progress Slider
                HStack(spacing: 10.0) {
                    Slider(value: $progress, in: 0...100)
                    Text("\(progress, specifier: "%.0f")%")
                }.padding(.horizontal)
                
                
                // Notes Editor
                Text("Notes:")
                    .font(.footnote)
                    .padding(.horizontal)
                TextEditor(text: $notes)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    .padding([.leading, .bottom, .trailing])
                
                //DisclosureGroup("Options") {
                    //Form {
                        // Due Date?
                        Toggle(isOn: $hasDueDate) {
                            Text("Remind me at time")
                        }.padding(.horizontal)
                        
                        if hasDueDate {
                            Form {
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
                                .padding(.all, 10)
                            }
                        }
                    //}
                //}.padding(.all, 10)
            }.padding([.leading, .bottom, .trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }.padding([.top, .leading, .trailing], 10)
    }
}


struct EditNotes_Previews: PreviewProvider {
    static var previews: some View {
        let notes: String = "Hi"
        let progress: Double = 25
        let showProgressUpdater: Bool = false
        let hasDueDate = false
        let dueDate: Date = Date()
        
        EditNotes(notes: .constant(notes), progress: .constant(progress), showProgressUpdater: .constant(showProgressUpdater), hasDueDate: .constant(hasDueDate), dueDate: .constant(dueDate), frequency: .constant(Frequency.Daily))
    }
}
