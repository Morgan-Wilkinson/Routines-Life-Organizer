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
                        .padding(.horizontal)
                Spacer()
                
                Form {
                    Button("Cancel") {showProgressUpdater.toggle()}
                    Button("Save") {showProgressUpdater.toggle()}
                    
                    ProgressSlider(progress: $progress)
                }.edgesIgnoringSafeArea([.bottom, .leading, .trailing])
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
