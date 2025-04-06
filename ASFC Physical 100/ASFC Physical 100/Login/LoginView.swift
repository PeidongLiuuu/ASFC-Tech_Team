//
//  LoginView.swift
//  ASFC Physical 100
//
//  Created by Jack Liu on 4/1/25.
//


import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationView {
            if isLoggedIn {
                HomeView() // <-- New page after login
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
            } else {
                isLoggedIn = true
                errorMessage = ""
                print("Login successful!")
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to ASFC!")
                .font(.largeTitle)
                .bold()
            Text("You have successfully logged in.")
                .font(.title2)
                .padding()
        }
    }
}

#Preview {
    LoginView()
}

