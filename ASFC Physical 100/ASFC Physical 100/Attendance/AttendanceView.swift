//
//  AttendanceView.swift
//
//
//  Created by Khai Ta on 4/6/25.
//

import SwiftUI

struct Attendee: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    
    init(name: String, imageURL: String) {
        self.name = name
        self.imageURL = imageURL
    }
}

struct AttendanceView: View {
    let attendees: [Attendee] = [
        Attendee(name: "Alice Johnson", imageURL: "https://randomuser.me/api/portraits/women/1.jpg"),
        Attendee(name: "Bob Smith", imageURL: "https://randomuser.me/api/portraits/men/2.jpg"),
        Attendee(name: "Charlie Kim", imageURL: "https://randomuser.me/api/portraits/men/3.jpg")
    ]
    
var body: some View {
        SheetView(attendees: attendees)
    }
}

struct SheetView: View {
    let attendees: [Attendee]

    var body: some View {
        NavigationView {
            List(attendees) { attendee in
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

                    Text(attendee.name)
                        .font(.headline)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Attendees")
        }
    }
}

#Preview {
    AttendanceView()
}
