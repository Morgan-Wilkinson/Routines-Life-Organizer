//
//  RoutineGroupsList.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/7/20.
//

import SwiftUI

struct RoutineGroupsList: View {
    @EnvironmentObject var model: Model
    @State var routineGroups: [RoutineGroup]
    @State var showSheet: Bool = false
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(routineGroups) { group in
                    NavigationLink(destination: RoutineItemList(routineGroup: group).environmentObject(model)) {
                        RoutineGroupCard(routineGroup: group)
                    }
                }
            }.padding(.horizontal)
        }.navigationTitle("Routine Groups")
        .navigationBarItems(trailing: Button(action: {showSheet.toggle()}, label: {
            Text("Add")
        }).sheet(isPresented: $showSheet) {
            NewGroup(dismissView: $showSheet)
        })
    }
}


struct RoutineGroupsList_Previews: PreviewProvider {
    static var previews: some View {
        let model: Model = Model()
        
        return NavigationView {
            RoutineGroupsList(routineGroups: model.routineGroups)
        }
    }
}

