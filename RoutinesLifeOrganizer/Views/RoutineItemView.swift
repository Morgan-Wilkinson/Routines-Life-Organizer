//
//  RoutineItemView.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/5/20.
//

import SwiftUI

struct RoutineItemView: View {
    @State var routine: RoutineItem
    
    // Date picker
    @State var datePicked: Date = Date()
    @State private var showDatePicker = false
    
    // Progress
    @State private var showProgressUpdater = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 5.0) {
                RoutineItemBackground(date: $datePicked).edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("Notes")
                        .font(.title)
                    TextEditor(text: $routine.notes)
                    
                    Spacer()
                    
                    DisclosureGroup("Update Progress", isExpanded: $showProgressUpdater) {
                        Slider(value: $routine.progress, in: 0.0...100, step: 0.1)
                    }
                    
                    ProgressView("Amount of task done", value: routine.progress, total: 100.0)
                    Text("Last edit date: \(routine.dateLastEdited)")
                }.padding(.all)
            }
        }.navigationTitle(routine.name)
    }
}

struct RoutineItemBackground: View {
    @Binding var date: Date
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.Peach)
            // Add a disclosure group
            DatePicker("Pick a date", selection: self.$date)
                .labelsHidden()
                .datePickerStyle(GraphicalDatePickerStyle())
        }
    }
}

struct RoutineItemView_Previews: PreviewProvider {
    static var previews: some View {
        let routine: RoutineItem = .dog
        
        return NavigationView {
            RoutineItemView(routine: routine)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
