//
//  ContentView.swift
//  UserDialog
//  Created by Karlo Mikec

import SwiftUI

struct ContentView: View {
    @State private var isAlert = false
    @State private var showErrorAlert = false
    @State private var Username: String = ""
    @State private var Password: String = ""
    
    private let correctUsername = "Kmikec20"
    private let correctPassword = "12345"
    
    var body: some View {
        Button("Sign In") {
            isAlert = true
        }
        .alert("Sign In", isPresented: $isAlert, actions: {
            TextField("Username", text: $Username)
            SecureField("Lozinka", text: $Password)
            
            Button("Sign In", action: {
                if Username == correctUsername && Password == correctPassword {
                    print("Successful login!")
                } else {
                    showErrorAlert = true
                }
            })
            
            Button("Cancel", role: .cancel, action: {})
        }, message: {
            Text("Enter correct user credentials!")
        })
        .alert("Wrong credentials!", isPresented: $showErrorAlert) {}
    }
}
