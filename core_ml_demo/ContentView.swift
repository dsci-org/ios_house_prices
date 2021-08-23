//
//  ContentView.swift
//  core_ml_demo
//
//  Created by Steeve on 23/08/2021.
//  Copyright © 2021 Steeve Laquitaine. All rights reserved.


import SwiftUI
import CoreML
import Foundation

struct ContentView: View {
  @State private var rm = 6.5
  @State private var age = 84.0
  @State private var ptratio = 16.5
    
  @State private var alertTitle = ""
  @State private var alertMessage = ""
  @State private var showingAlert = false
    
  var body: some View {
      NavigationView {
        VStack {
        Text("House Attributes")
            .font(.title)
        Stepper(value: $rm, in: 1...10,
                step: 0.5) {
            Text("Rooms: \(rm)")
          }
          Stepper(value: $age, in: 1...100,
              step: 0.5) {
          Text("Age: \(age)")
          }
          Stepper(value: $ptratio, in: 12...22,
              step: 0.5) {
          Text("Pupil-teacher ratio: \(ptratio)")
          }
          .navigationBarTitle("Price Predictor")
          .navigationBarItems(trailing:
              Button(action: predictPrice) {
                  Text("Predict Price")
              }
          )
          .alert(isPresented: $showingAlert) {
              Alert(title: Text(alertTitle),
                    message: Text(alertMessage),
              dismissButton: .default(Text("OK")))
          }
        }
      }
  }
            
func predictPrice() {
    let model = bhousing()
    do { let p = try
      model.prediction(
          RM: Double(rm),
          AGE: Double(age),
          PTRATIO: Double(ptratio))

        alertMessage = "$\(String((p.PRICE * 1000)))"
      alertTitle = "The predicted price is:"
  } catch {
    alertTitle = "Error"
    alertMessage = "Please retry."
  }
    showingAlert = true
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
