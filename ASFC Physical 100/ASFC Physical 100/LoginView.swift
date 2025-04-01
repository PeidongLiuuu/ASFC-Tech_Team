//
//  LoginView.swift
//  ASFC Physical 100
//
//  Created by Jack Liu on 4/1/25.
//


import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("ASFC Physical 100")
                    .font(.largeTitle)
                    .bold()
                
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
    
    func handleLogin() {
        if email.isEmpty || password.isEmpty {
            errorMessage = "Please enter both email and password."
        } else if email == "test@example.com" && password == "password" {
            isLoggedIn = true
            errorMessage = ""
            print("Login successful!")
        } else {
            errorMessage = "Invalid credentials."
        }
    }
    
    func handleGoogleSignIn() {
        // 🔐 This is a placeholder.
        print("Google Sign-In tapped")
        // You’ll need to integrate Firebase Auth + GoogleSignIn SDK here.
    }
}

struct RegisterView: View {
    var body: some View {
        Text("Registration Page Here")
            .font(.title)
    }
}

#Preview {
    LoginView()
}
