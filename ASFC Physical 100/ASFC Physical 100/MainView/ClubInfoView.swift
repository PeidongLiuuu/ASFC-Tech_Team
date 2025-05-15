//
//  ClubInfoView.swift
//  ASFC Physical 100

import SwiftUI
import FirebaseFirestore

//struct ClubInfoView: View {
//    @State private var topMessage: String = "Loading..."
//    @State private var announcements: [String] = []
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//
//                
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Welcome")
//                        .font(.headline)
//                        .foregroundColor(.gray)
//
//                    Text(topMessage)
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                }
//                .padding()
//                .background(Color.white)
//                .cornerRadius(16)
//                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
//
//                
//                VStack(alignment: .leading, spacing: 12) {
//                    Text("Announcements")
//                        .font(.headline)
//                        .padding(.bottom, 5)
//
//                    ForEach(announcements, id: \.self) { item in
//                        Text(item)
//                            .padding()
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .background(Color(.systemGray6))
//                            .cornerRadius(12)
//                    }
//
//                }
//                .padding()
//                .background(Color.white)
//                .cornerRadius(16)
//                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
//            }
//            .padding()
//        }
//        .background(Color(.systemGroupedBackground).ignoresSafeArea())
//        .onAppear {
//            fetchTopMessage()
//            fetchAnnouncements()
//        }
//    }
//
//    func fetchTopMessage() {
//        let db = Firestore.firestore()
//        db.collection("appContent").document("welcomeMessage").getDocument { snapshot, error in
//            if let data = snapshot?.data(), let message = data["text"] as? String {
//                topMessage = message
//            } else {
//                topMessage = "Welcome to ASFC!"
//            }
//        }
//    }
//
//    func fetchAnnouncements() {
//        let db = Firestore.firestore()
//        db.collection("announcements").getDocuments { snapshot, error in
//            if let documents = snapshot?.documents {
//                announcements = documents.compactMap { $0.data()["text"] as? String }
//            }
//        }
//    }
//}


import SwiftUI
import FirebaseFirestore

struct ClubInfoView: View {
    @State private var topMessage: String = "Loading..."
    @State private var announcements: [String] = []

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)

            VStack(alignment: .leading, spacing: 16) {
                
                // 🔵 Top Message Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text(topMessage)
                        .font(.title3)
                        .fontWeight(.semibold)
                }

                Divider()

                // 🔴 Announcements Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Announcements")
                        .font(.headline)

                    ForEach(announcements, id: \.self) { item in
                        Text(item)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .onAppear {
            fetchTopMessage()
            fetchAnnouncements()
        }
    }

    func fetchTopMessage() {
        let db = Firestore.firestore()
        db.collection("appContent").document("welcomeMessage").getDocument { snapshot, error in
            if let data = snapshot?.data(), let message = data["text"] as? String {
                topMessage = message
            } else {
                topMessage = "Welcome to the ASFC Club Event!"
            }
        }
    }

    func fetchAnnouncements() {
        let db = Firestore.firestore()
        db.collection("announcements").getDocuments { snapshot, error in
            if let documents = snapshot?.documents {
                announcements = documents.compactMap { $0.data()["text"] as? String }
            }
        }
    }
}






#Preview {
    ClubInfoView()
}

