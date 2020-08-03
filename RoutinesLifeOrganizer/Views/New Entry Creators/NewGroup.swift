//
//  NewGroup.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/28/20.
//

import SwiftUI

struct NewGroup: View {
    @EnvironmentObject var model: Model
    @Binding var dismissView: Bool
    
    // Icon Shape and attributes
    @State var color: Color = Color.yellow
    @State var icon: String = "sun.min"
    @State var shape: Int = 1
    var colors: [Color] = [.yellow, .orange, .red, .pink, .gray, .green, .blue, .purple]
    
    // TextField
    @State  var name: String = ""
    
    // Icon List
    var iconList: GroupIcons = GroupIcons()
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        NavigationView {
            VStack {
                NewGroupIcon(color: $color, icon: $icon, shape: $shape)//.padding(.top)
                
                TextField("Group Name", text: $name)
                    .padding([.top, .leading, .trailing])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Divider()
                
                LazyHStack {
                    Button(action: {shape = 1}, label: {
                        Circle().fill(color)
                            .frame(width: 40, height: 50)
                    })
                    Button(action: {shape = 0}, label: {
                        RoundedRectangle(cornerRadius: 5).fill(color)
                            .frame(width: 40, height: 40)
                    })
                }.frame(height: 50)
                
                LazyHStack {
                ForEach(0..<colors.count) { i in
                    Button(action: {color = colors[i]}, label: {
                        Circle().fill(colors[i])
                            .frame(width: 40, height: 50)
                    })
                }
                }.frame(height: 50)
                
                Divider()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(0..<iconList.icons.count) { i in
                            Button(action: {icon = iconList.icons[i]}, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5).fill(color)
                                        .frame(width: 50, height: 50, alignment: .center)
                                    Image(systemName: iconList.icons[i])
                                        .foregroundColor(Color.black)
                                        
                                }.padding()
                            })
                        }
                    }
                }
            }
        }.navigationBarTitle(Text("New Group"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {}, label: {Text("Save")}))
    }
}

struct NewGroup_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewGroup(dismissView: .constant(false))
        }
    }
}
