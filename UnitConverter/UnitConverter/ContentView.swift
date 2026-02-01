//
//  ContentView.swift
//  UnitConverter
//
//  Created by Sean McDonald on 1/27/26.
//

import SwiftUI

struct ContentView: View {
    let conversions = ["Temp", "Length", "Time", "Volume"]
    @State private var conversionChoice: String = "Temp"
    @State private var selectedInputUnit: String = ""
    @State private var selectedOutputUnit: String = ""
    @State private var inputValue: Double = 0
    
    var units: [String] {
        switch conversionChoice {
            case "Temp":
                return ["Celsius", "Kelvin", "Fahrenheit"]
            case "Length":
                return ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
            case "Time":
                return ["Seconds", "Minutes", "Hours", "Days"]
            case "Volume":
                return ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
            default:
                return []
        }
    }
    
    var outputValue: Double {
        switch conversionChoice {
            case "Temp":
                return tempConversion(selectedInputUnit, selectedOutputUnit, inputValue)
            default:
                return 0.0
        }
    }

    
    func tempConversion(_ inputUnit: String, _ outputUnit: String, _ input: Double) -> Double {
        switch inputUnit {
            case "Celsius":
                if outputUnit == "Celsius" {
                    return input
                } else if outputUnit == "Fahrenheit" {
                    return input * 9/5 + 32
                } else {
                    return input + 273.15
                }
            case "Fahrenheit":
                if outputUnit == "Celsius" {
                    return (input - 32) * 5/9
                } else if outputUnit == "Fahrenheit" {
                    return input
                } else {
                    return (input - 32) * 5/9 + 273.15
                }
            case "Kelvin":
                if outputUnit == "Celsius" {
                    return input - 273.15
                } else if outputUnit == "Fahrenheit" {
                    return (input - 273.15) * 9/5 + 32
                } else {
                    return input
                }
            default:
                return 0.0
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose conversion type") {
                    Picker("Conversion", selection: $conversionChoice) {
                        ForEach(conversions, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Value to convert") {
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Convert from") {
                        Picker("Input Unit", selection: $selectedInputUnit) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                }
                Section("Convert to") {
                    Picker("Output Unit", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Text("\(outputValue) \(selectedOutputUnit)")
                }
                
                
            }
            .navigationTitle(Text("Unit Converter"))
        }
    }
}

#Preview {
    ContentView()
}


// choose conversion type (temp, length, time, volume)
// use picker menu

// based on choice computed var to display possible units of conversion
// functions for different types of conversions
// switch statements to co
