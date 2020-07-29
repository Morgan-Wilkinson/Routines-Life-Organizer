//
//  NewGroup.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/28/20.
//

import SwiftUI

struct NewGroup: View {
    @EnvironmentObject var model: Model
    
    // Icon Shape and attributes
    @State private var color: Color = Color.red
    @State private var icon: String = "sun.min"
    @State private var shape: Int = 0
    var colors: [Color] = [.red, .pink, .gray, .green, .yellow, .orange, .blue, .purple]
    
    // TextField
    @State private var name: String = ""
    
    // Icon List
    private var iconList: GroupIcons = GroupIcons()
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        VStack {
            NewGroupIcon(color: $color, icon: $icon, shape: $shape)
            
            TextField("Group Name", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
             LazyHStack {
                ForEach(0..<colors.count) { i in
                    Button(action: {color = colors[i]}, label: {
                        Circle().fill(colors[i])
                            .frame(width: 40)
                    })
                }
             }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(0..<iconList.icons.count) { i in
                        Button(action: {icon = iconList.icons[i]}, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5).fill(color)
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image(systemName: iconList.icons[i])                                    
                            }.padding()
                        })
                    }
                }
            }
        }
    }
}

struct NewGroup_Previews: PreviewProvider {
    static var previews: some View {
        NewGroup()
    }
}
