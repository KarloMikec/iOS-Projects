//
//  ContentView.swift
//  RAMPU - Implementacija koncepta interakcije s korisnikom
//
//  Created by Karlo Mikec on 07.10.2023..
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var isShowingPopup = false
    
    
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Button("Log In"){
                notify.sendNotification(date: Date(), type: "time", timeInterval: 5, title: "Success!", body: "This is a reminder that you set 5 seconds ago!")
            }
            
            DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
            Button("Schedule notification"){
                notify.sendNotification(date: selectedDate, type: "date", title: "What's up!", body: "This is a reminder that you set up with the date picker!")
            }.tint(.orange)
            
            
            Spacer()
            Text("Not Working!").foregroundColor(.gray).italic()
            Button("Request premission"){
                notify.askPremission()
            }
        }
        .padding()
    //FAB NOTIFICATION
        ZStack{
            Button(action: {
                self.isShowingPopup = true
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color.gray)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            })
            .padding()
            .shadow(radius: 5)
            
            .background(
                        Color.white.opacity(isShowingPopup ? 0.4 : 0) // Postavite prozirnost ovdje
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                self.isShowingPopup = false
                            })

            .alert(isPresented: $isShowingPopup) {
                Alert(
                    title: Text("Uber Would Like To Send You Notifications" ),
                    message: Text("Notifications may include alerts, sounds and icon badges. These can be configured in Settings"),
                    primaryButton: 
                            .default(Text("Okay")) {
                                self.isShowingPopup = false
                            },
                    secondaryButton:
                            .destructive(Text("Don't Allow")) {
                                self.isShowingPopup = false
                })
            }
        }
    }
    
}

struct ContentView_Previews:
    PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
