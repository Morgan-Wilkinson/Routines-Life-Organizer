//
//  NewEntry.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/8/20.
//

import SwiftUI

struct NewEntry: View {
    @State var routine: RoutineItem
    // Date picker
    @State var datePicked: Date = Date()
    @State private var showDatePicker = false
    
    // Progress
    @State private var showProgressUpdater = false
    @State var progress: Double = 0.0
    // Notes
    @State var notes = ""
    @State private var showNotes = true
    
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
                //}.padding(.all, 10)
                Spacer()
                
                // Progress
                if showProgressUpdater {
                    //UpdateProgress(progress: $routine.progress)
                    Form {
                        //HStack {
                            Button("Cancel") {showProgressUpdater.toggle()}
                            Spacer()
                            Button("Save") {showProgressUpdater.toggle()}
                        //}
                        HStack(spacing: 10.0) {
                            Slider(value: $routine.progress, in: 0...100)
                            Text("\(routine.progress, specifier: "%.0f")%")
                        }.padding(.all, 10)
                    }.edgesIgnoringSafeArea([.bottom, .leading, .trailing])
                }
                else {
                    VStack(alignment: .leading, spacing: 10.0) {
                        ProgressView("Amount of task done", value: routine.progress, total: 100.0)
                            .progressViewStyle(DarkBlueShadowProgressViewStyle())
                        Text("Last edit date: \(routine.dateLastEdited)")
                    }.padding(.all, 10)
                }
            }
        }.navigationTitle(Text(routine.name))
        .navigationBarItems(trailing: Button("Update Progress") {
            showProgressUpdater.toggle()})
    }
}


struct NewEntry_Previews: PreviewProvider {
    static var previews: some View {
        var routine: RoutineItem = .dog
        routine.notes = "\t Mauris blandit, magna a pharetra accumsan, diam dolor consequat mi, imperdiet tincidunt tellus mauris in sapien. Praesent semper, sem vitae consequat finibus, ligula ipsum hendrerit nunc, vel blandit erat magna sit amet enim. Donec risus libero, sagittis vitae lacinia a, fringilla maximus lacus. Nullam eleifend, leo a mattis pretium, metus ligula rhoncus ex, sit amet sagittis ex augue sit amet est. Aliquam tristique nisl eleifend, cursus lacus in, dapibus felis. In at lacus sit amet risus blandit feugiat in in libero. Sed malesuada ante in lorem tristique, eu malesuada ante bibendum. Cras molestie at sem non porta. Nunc quis congue ex. Nam sit amet elit mauris. Mauris mauris elit, ultricies vitae magna vitae, sodales suscipit magna. Nulla vehicula orci sed. \n\n Mauris blandit, magna a pharetra accumsan, diam dolor consequat mi, imperdiet tincidunt tellus mauris in sapien. Praesent semper, sem vitae consequat finibus, ligula ipsum hendrerit nunc, vel blandit erat magna sit amet enim. Donec risus libero, sagittis vitae lacinia a, fringilla maximus lacus. Nullam eleifend, leo a mattis pretium, metus ligula rhoncus ex, sit amet sagittis ex augue sit amet est. Aliquam tristique nisl eleifend, cursus lacus in, dapibus felis. In at lacus sit amet risus blandit feugiat in in libero. Sed malesuada ante in lorem tristique, eu malesuada ante bibendum. Cras molestie at sem non porta. Nunc quis congue ex. Nam sit amet elit mauris. Mauris mauris elit, ultricies vitae magna vitae, sodales suscipit magna. Nulla vehicula orci sed."
        return NavigationView {
            NewEntry(routine: routine)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
