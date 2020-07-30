//
//  ProgressSlider.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/9/20.
//

import SwiftUI

struct ProgressSlider: View {
    @Binding var progress: Double
    
    var body: some View {
        HStack(spacing: 10.0) {
            Slider(value: $progress, in: 0...100)
            Text("\(progress, specifier: "%.0f")%")
        }.padding(.all, 10)
    }
}

struct ProgressSlider_Previews: PreviewProvider {
    static var previews: some View {
        let progress: Double = 25.0
        
        return ProgressSlider(progress: .constant(progress))
    }
}
