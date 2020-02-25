//
//  UpdateList.swift
//  SwiftUI Design and Code
//
//  Created by Quin’darius Lyles-Woods on 2/25/20.
//  Copyright © 2020 Quin’darius Lyles-Woods. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(updateData) { update in
                NavigationLink(destination: Text(update.text)) {
                    HStack {
                        Image(update.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .cornerRadius(20)
                            .padding(.trailing, 4)
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(update.title)
                                .font(.system(size: 20 , weight: .bold))
                            Text(update.text)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                            Text(update.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            
                        }
                    }.padding(.vertical, 8)
                }
                .navigationBarTitle(Text("Updates"))
            }
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id =  UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI", text: "text", date: "Jan 1"),
    Update(image: "Card1", title: "React", text: "text", date: "Jan 1"),
    Update(image: "Card1", title: "Advanced SwiftUI", text: "text", date: "Jan 1"),
    Update(image: "Card1", title: "iOS", text: "text", date: "Jan 1"),
]
