//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Jan Kaiponen on 7.12.2022.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums : [DailyScrum]
    var body: some View {
        List{
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)
                    .navigationTitle(scrum.title)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {}){
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    @State static var scrums = DailyScrum.sampleData
    static var previews: some View {
        NavigationView{
            //ScrumsView(scrums: .constant( DailyScrum.sampleData))
            ScrumsView(scrums: $scrums)
        }
    }
}
