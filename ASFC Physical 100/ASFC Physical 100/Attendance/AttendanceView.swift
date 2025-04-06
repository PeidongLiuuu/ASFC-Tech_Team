//
//  AttendanceView.swift
//
//
//  Created by Khai Ta on 4/6/25.
//

import SwiftUI

// represents each attendee with name, image URL, and associated club
struct Attendee: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    let club: String
    
    init(name: String, imageURL: String, club: String) {
        self.name = name
        self.imageURL = imageURL
        self.club = club
    }
}

// displays SheetView
struct AttendanceView: View {
    let attendees: [Attendee] = [
        Attendee(name: "Khai Ta", imageURL: "https://randomuser.me/api/portraits/men/1.jpg", club: "VSA"),
        Attendee(name: "Howard Wu", imageURL: "https://randomuser.me/api/portraits/men/2.jpg", club: "ASFC"),
        Attendee(name: "Jack Liu", imageURL: "https://randomuser.me/api/portraits/men/3.jpg", club: "ASFC"),
        Attendee(name: "Andy Chen", imageURL: "https://randomuser.me/api/portraits/men/4.jpg", club: "ASFC"),
        Attendee(name: "Person", imageURL: "https://randomuser.me/api/portraits/men/3.jpg", club: "FJSA"),
        Attendee(name: "Person2", imageURL: "https://randomuser.me/api/portraits/men/3.jpg", club: "FJSA")
    ]
    
    var body: some View {
        SheetView(attendees: attendees)
    }
}

// displays attendees grouped by their clubs with search and pull-to-refresh features
struct SheetView: View {
    let attendees: [Attendee]
    @State private var searchText = ""
    @State private var isRefreshing = false

    // filters and sorts attendees by club name based on search input
    var filteredAttendees: [Attendee] {
        let filtered = searchText.isEmpty
            ? attendees
            : attendees.filter { $0.name.localizedCaseInsensitiveContains(searchText) }

        return filtered.sorted { $0.club < $1.club }
    }

    // groups filtered attendees by club for sectioned list display
    var groupedAttendees: [String: [Attendee]] {
        Dictionary(grouping: filteredAttendees, by: { $0.club })
    }

    var body: some View {
        NavigationView {
            // displays attendees grouped by club in a sectioned list
            List {
                ForEach(groupedAttendees.keys.sorted(), id: \.self) { club in
                    Section(header: Text(club)) {
                        ForEach(groupedAttendees[club]!) { attendee in
                            HStack(spacing: 15) {
                                AsyncImage(url: URL(string: attendee.imageURL)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())

                                VStack(alignment: .leading) {
                                    Text(attendee.name)
                                        .font(.headline)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
            .refreshable {
                isRefreshing = true;                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isRefreshing = false
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Attendees")
        }
    }
}

#Preview {
    AttendanceView()
}
