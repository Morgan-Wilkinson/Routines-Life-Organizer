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
    
    
    var body: some View {
        ZStack{
            RoutineItemBackground().edgesIgnoringSafeArea([.top, .leading, .trailing])
            
            VStack(alignment: .leading, spacing: 10.0) {
                // Fix the DisclosureGroup when apple releases a fix for it
                //DisclosureGroup("Notes", isExpanded: $showNotes) {
                    Text("Notes")
                        .font(.title)
                        .padding(.all, 10)

                    TextEditor(text: $notes)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        .padding(.horizontal)
                Spacer()
                
                EditNotes(notes: $notes, progress: $progress, showProgressUpdater: $showProgressUpdater)
                //ProgressSlider(progress: .constant(5))
            }
        }.navigationTitle(Text("New Entry"))
        .navigationBarItems(trailing: Button("Save") {
            showProgressUpdater.toggle()})
    }
}


struct NewEntry_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationView {
            NewEntry()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct EditNotes: View {
    @Binding var notes: String
    @Binding var progress: Double
    @Binding var showProgressUpdater: Bool
    
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
            }
        }.padding([.top, .leading, .trailing], 10)
    }
}
