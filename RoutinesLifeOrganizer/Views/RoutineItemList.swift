//
//  RoutineItemList.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/16/20.
//

import SwiftUI

struct RoutineItemList: View {
    @EnvironmentObject var model: Model
    @State var routineGroup: RoutineGroup
    @State private var selection: Set<String> = []
    
    var body: some View {
        List(selection: $selection) {
            ForEach(routineGroup.entries) { entry in
                NavigationLink(destination: RoutineItemView(routine: entry)) {
                    Label(entry.name, systemImage: entry.icon)
                }
            }
        }.listStyle(SidebarListStyle())
        .navigationTitle(routineGroup.name)
        .navigationBarItems(trailing: NavigationLink(destination: NewEntry(routineGroup: $routineGroup).environmentObject(model), label: {
                Text("Add")
        }))
    }
}


struct RoutineItemList_Previews: PreviewProvider {
    static var previews: some View {
        let model: Model = Model()
        
        NavigationView {
            RoutineItemList(routineGroup: model.routineGroups[0]).environmentObject(model)
        }
    }
}
