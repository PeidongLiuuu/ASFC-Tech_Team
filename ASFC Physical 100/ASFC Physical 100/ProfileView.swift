//
//  ProfileView.swift
//  ASFC Physical 100
//
//  Created by Howard Wu on 4/6/25.
//


import SwiftUI
import NukeUI

// MARK: - User Model
class User: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published var club: String
    @Published var profileImageURL: String

    init(name: String, email: String, club: String, profileImageURL: String) {
        self.name = name
        self.email = email
        self.club = club
        self.profileImageURL = profileImageURL
    }
}

// MARK: - Profile View
struct ProfileView: View {
    @StateObject private var user = User(
        name: "John Monroe",
        email: "john@figma.com",
        club: "FJSA",
        profileImageURL: "https://picsum.photos/200"
    )

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack {
                    ZStack {
                        Color.blue.opacity(0.2)
                            .frame(height: 120)
                            .cornerRadius(20)

                        VStack {
                            LazyImage(url: URL(string: user.profileImageURL)) { state in
                                if let image = state.image {
                                    image
                                        .resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 4)
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 80, height: 80)
                        }
                        .offset(y: 40)
                    }
                    .padding(.bottom, 40)

                    Text(user.name)
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text(user.email)
                        .foregroundColor(.gray)
                }

                Divider().padding(.horizontal)

                VStack(spacing: 15) {
                    InfoRow(label: "Club", value: user.club)
                }
                .padding(.horizontal)

                Divider().padding(.horizontal)

                VStack(spacing: 20) {
                    NavigationLink(destination: SettingsView(user: user)) {
                        OptionRow(icon: "gearshape.fill", label: "Settings")
                    }
                    OptionRow(icon: "arrow.right.square", label: "Log out")
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .navigationBarHidden(true)
        }
    }
}

// MARK: - InfoRow
struct InfoRow: View {
    var label: String
    var value: String
    var icon: String? = nil

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            if let icon = icon {
                Image(systemName: icon)
                Text(value)
            } else {
                Text(value)
            }
        }
    }
}

// MARK: - OptionRow
struct OptionRow: View {
    var icon: String
    var label: String

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(label)
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

// MARK: - SettingsView
struct SettingsView: View {
    @ObservedObject var user: User
    @State private var showSaveAlert = false
    @State private var clubOptions = ["AFSC", "FJSA", "HKSA", "VSA", "ASA", "TASA", "PSFA"]

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Text("Edit Profile")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)

                LazyImage(url: URL(string: user.profileImageURL))
                     { state in
                        if let image = state.image {
                            image
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 4)
                        } else {
                            ProgressView()
                        }
                    }
                .frame(width: 100, height: 100)

                EditableField(label: "Image URL", text: $user.profileImageURL)
                EditableField(label: "Name", text: $user.name)
                EditableField(label: "Email", text: $user.email)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Club")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Picker("Select your club", selection: $user.club) {
                        ForEach(clubOptions, id: \.self) { club in
                            Text(club).tag(club)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }

                Button(action: {
                    showSaveAlert = true
                }) {
                    Text("Save")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top)

                Spacer()
            }
            .padding()
            .alert("Changes Saved", isPresented: $showSaveAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - EditableField
struct EditableField: View {
    var label: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .foregroundColor(.gray)
                .font(.subheadline)
            TextField("Enter \(label.lowercased())", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


