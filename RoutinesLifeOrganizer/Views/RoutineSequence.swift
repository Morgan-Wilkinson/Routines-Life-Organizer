//
//  RoutineSequence.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/22/20.
//

import SwiftUI

struct RoutineSequence: View {
    @State var routineGroup: RoutineGroup
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(routineGroup.entries) { entry in
                    NavigationLink(destination: RoutineItemView(routine: entry)) {
                        RoutinePreviewCard(routine: entry)
                    }.padding()
                }
            }
        }.navigationTitle("\(routineGroup.name) Sequence")
    }
}

struct RoutineSequence_Previews: PreviewProvider {
    static var previews: some View {
        let model: Model = Model()
        
        return NavigationView {
            RoutineSequence(routineGroup: model.routineGroups[0])
        }
    }
}
