//
//  CardView.swift
//  Scrumdinger
//
//  Created by Jan Kaiponen on 7.12.2022.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(/*@START_MENU_TOKEN@*/.isHeader/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees" )
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
            }
            .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
        }
        .padding(.all)
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        VStack {
            Spacer()
            CardView(scrum: scrum )
                .background(scrum.theme.mainColor)
                .frame(width: 390.0, height: 60.0)
            Spacer()
        }

        
    }
}
