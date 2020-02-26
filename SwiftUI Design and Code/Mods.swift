//
//  Mods.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/25/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct shadowMod : ViewModifier {
    func body(content: Content) -> some View{
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct fontMod: ViewModifier{
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .rounded))
    }
}

struct customFontMod : ViewModifier {
    var size: CGFloat = 28
    func body(content: Content)-> some View{
        content.font(.custom("WorkSans-Bold", size: size))
    }
}
