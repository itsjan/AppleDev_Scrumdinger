//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Jan Kaiponen on 7.12.2022.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var data = DailyScrum.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .background(scrum.theme.mainColor)
                        .foregroundColor(scrum.theme.accentColor)
                        .cornerRadius(4)
                        .padding(4)
                }
                .accessibilityElement(children: /*@START_MENU_TOKEN@*/.combine/*@END_MENU_TOKEN@*/)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees){attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit"){
                isPresentingEditView = true
                data = scrum.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done"){
                                isPresentingEditView = false
                                scrum.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
        
    }
}
