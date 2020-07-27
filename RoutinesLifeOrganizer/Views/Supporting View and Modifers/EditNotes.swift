//
//  EditNotes.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/20/20.
//

import SwiftUI

struct EditNotes: View {
    @EnvironmentObject var model: Model
    
    @Binding var notes: String
    @Binding var progress: Double
    @Binding var showProgressUpdater: Bool
    
    // Frequency?
    @Binding var hasFreq: Bool
    @Binding var frequency: Frequency
    
    // Time
    @Binding var hasTime: Bool
    @Binding var timeOfOccurrence: Date
    
    // RoutineGroup
    @Binding var routineGroup: RoutineGroup
    
    var body: some View {
        GeometryReader { geometry in
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
                    
                    NavigationLink(destination: NotesOptions(hasFreq: $hasFreq, frequency: $frequency, hasTime: $hasTime, timeOfOccurrence: $timeOfOccurrence, selectedGroup: $routineGroup).environmentObject(model)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.Peach)
                            Text("Options")
                        }
                    }.padding(.all, 10)
                    .frame(height: geometry.size.height / 12)
                }
            }.padding([.top, .leading, .trailing], 10)
        }
    }
}


struct EditNotes_Previews: PreviewProvider {
    static var previews: some View {
        let notes: String = "Hi"
        let progress: Double = 25
        let showProgressUpdater: Bool = false
        let hasFreq = true
        let hasTime: Bool = true
        let timeOfOccurrence = Date()
        let model = Model()
        EditNotes(notes: .constant(notes), progress: .constant(progress), showProgressUpdater: .constant(showProgressUpdater), hasFreq: .constant(hasFreq), frequency: .constant(Frequency.Daily), hasTime: .constant(hasTime), timeOfOccurrence: .constant(timeOfOccurrence), routineGroup: .constant(model.routineGroups[0]))
    }
}
