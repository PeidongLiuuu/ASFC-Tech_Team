//
//  LoginView.swift
//  ASFC Physical 100
//
//  Created by Jack Liu on 4/1/25.
//


import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var errorMessage = ""
    @State private var userName = ""

    var body: some View {
        NavigationView {
            if isLoggedIn {
                HomeView(userName: userName) 
            } else {
                VStack(spacing: 20) {
                    Text("ASFC")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Physical 100")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    
                    Button(action: handleLogin) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: RegisterView()) {
                        Text("Don’t have an account? Register")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .padding(.top)

                    Spacer()
                }
                .padding()
            }
        }
    }
    
    func handleLogin() {
        if email.isEmpty || password.isEmpty {
            errorMessage = "Please enter both email and password."
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = "Login failed: \(error.localizedDescription)"
            } else if let user = authResult?.user {
                fetchUserName(uid: user.uid)
            }
        }
    }
    
    func fetchUserName(uid: String) {
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { document, error in
            if let document = document, document.exists {
                userName = document.data()?["name"] as? String ?? "User" // Default to "User" if name not found
                isLoggedIn = true
            } else {
                errorMessage = "User data not found."
            }
        }
    }
}


struct HomeView: View {
    var userName: String
    
    var body: some View {
        VStack {
            Text("Welcome to ASFC!")
                .font(.largeTitle)
                .bold()
            Text("\(userName), you have successfully logged in.")
                .font(.title2)
                .padding()
        }
    }
}

#Preview {
    LoginView()
}

