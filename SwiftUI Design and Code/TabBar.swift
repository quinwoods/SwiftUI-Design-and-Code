//
//  TabBar.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/25/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem{
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem{
                           Image(systemName: "rectangle.stack.fill")
                           Text("Packages")
                       }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
