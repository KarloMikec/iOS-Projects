//  ContentView.swift
//  ToastNotification
//  Created by Karlo Mikec

import SwiftUI
import SimpleToast

struct ContentView: View {
    @State private var Toast = false
    
    private let toastKarakteristike = SimpleToastOptions(
        alignment: .bottom,
        hideAfter: 3,
        animation: .easeIn,
        modifierType: .fade
        )
    
    var body: some View {
        VStack (spacing: 20){
            Image(systemName: "person")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Show toast"){
                Toast.toggle()
            }
        }
        .simpleToast(isPresented: $Toast, options: toastKarakteristike){
            HStack{
                Image (systemName: "arrowshape.turn.up.right.fill")
                Text ("The Toast is ready !").bold()
            }
            .padding(23)
            .background(Color.gray.opacity(0.5))
            .foregroundColor(Color.white)
            .cornerRadius(14)
        }
    }
}

#Preview {
    ContentView()
}

