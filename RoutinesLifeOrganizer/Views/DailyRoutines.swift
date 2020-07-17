//
//  DailyRoutines.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/16/20.
//

import SwiftUI

struct DailyRoutines: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.Mustard)
            Text("Hello, World!")
        }
    }
}

struct DailyRoutines_Previews: PreviewProvider {
    static var previews: some View {
        DailyRoutines()
    }
}
