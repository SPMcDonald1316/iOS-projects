//
//  ContentView.swift
//  BetterRest
//
//  Created by Sean McDonald on 2/18/26.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
                }
                Spacer()
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .padding(EdgeInsets(top: 5, leading: 100, bottom: 5, trailing: 100))
                }
                Spacer()
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                        .padding(EdgeInsets(top: 5, leading: 100, bottom: 5, trailing: 100))
                }
                Spacer()
                Spacer()
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents(
                [.hour, .minute],
                from: wakeUp
            )
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(
                hour + minute
            ), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
        } catch {}
    }
}

#Preview {
    ContentView()
}
