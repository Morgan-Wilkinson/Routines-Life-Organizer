//
//  HighlightedRoutines.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/16/20.
//

import SwiftUI

struct HighlightedRoutines: View {
    // This will hold all the daily routines.
    @State var routineGroup: RoutineGroup
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.Peach)
            ScrollView {
                VStack(alignment: .leading) {
                    Text(routineGroup.name)
                        .font(.title)
                        .fontWeight(.semibold)
                    ForEach(routineGroup.entries) { entry in
                        NavigationLink(destination: RoutineItemView(routine: entry)) {
                            Label(entry.name, systemImage: "record.circle.fill")
                        }
                        Divider()
                    }
                }.padding(.all, 10)
            }
        }.padding(.all, 10)
    }
}

struct HighlightedRoutines_Previews: PreviewProvider {
    static var previews: some View {
        let model: Model = Model()
        
        NavigationView {
            HighlightedRoutines(routineGroup: model.routineGroups[0])
        }.previewLayout(.sizeThatFits)
    }
}
