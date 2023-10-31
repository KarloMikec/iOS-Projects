//  ContentView.swift
//  FloatingActionButton
//  Created by Karlo Mikec

import SwiftUI

struct ContentView: View {
    @State private var isFABVisible = false
    @State private var isAlertPresented = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    if isFABVisible {
                        Button(action: {
                            isAlertPresented.toggle()
                        }) {
                            Image(systemName: "message")
                                .padding(20)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        .transition(.scale)
                    }
                    Button(action: {
                        isFABVisible.toggle()
                    }) {
                        Image(systemName: isFABVisible ? "xmark" : "plus")
                            .padding(30)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    .transition(.scale)
                    .padding(20)
                }
            }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("Confirmed"),
                message: Text("You're all set to go"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



