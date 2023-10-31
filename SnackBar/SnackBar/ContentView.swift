//  ContentView.swift
//  SnackBar
//  Created by Karlo Mikec

import SwiftUI

struct ContentView: View {
    @State private var Snackbar = false
    
    var body: some View {
        Button("Show SnackBar"){
            Snackbar = true
        }
        .alert(isPresented: $Snackbar) {
            Alert(
            title: Text("No Internet Connection"),
            message: Text("Make sure your device is connected to the internet."),
            dismissButton: .default(Text("OK"))
            )
        }
    }
}
