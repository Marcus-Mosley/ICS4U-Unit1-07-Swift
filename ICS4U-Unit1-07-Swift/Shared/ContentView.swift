//
// ContentView.swift
// ICS4U-Unit1-07-Swift
//
// Created by Marcus A. Mosley on 2021-01-22
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var showingAlert = false
    @State private var height: Double = 0
    
    var body: some View {
        VStack {
            Text("A height of \(String(height)) inches will result in a board that is exactly one board foot.")
                .font(.largeTitle)
            TextField("Enter the length of the board (in): ", text: $length)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .keyboardType(.numberPad)
            TextField("Enter the width of the board (in): ", text: $width)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .keyboardType(.numberPad)
            Button(action: {
                if Int(length) == nil && Int(length)! <= 0 {
                    showingAlert = true
                } else if Int(width) == nil && Int(width)! <= 0 {
                    showingAlert = true
                } else {
                    height = boardFoot(Double(length)!, Double(width)!)
                    
                }
            }) {
                Text("Click Here")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"), dismissButton: .default(Text("Got It!")))
            }
        }
    }
    
    func boardFoot(_ length: Double, _ width: Double) -> Double {
        
        return 144 / (length * width)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
