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
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.Mustard)
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(routineGroup.entries) { entry in
                        Label(entry.name, systemImage: "record.circle.fill")
                    }
                }.padding(.all, 10)
            }
        }
    }
}

struct HighlightedRoutines_Previews: PreviewProvider {
    static var previews: some View {
        let model: Model = Model()
        
        HighlightedRoutines(routineGroup: model.routineGroups[0])
            .previewLayout(.fixed(width: 350, height: 160))
    }
}
