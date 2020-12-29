//
//  ContentView.swift
//  TipCalculator
//
//  Created by Denis Volkov on 29.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercent = 0
    
    let tipPercents = [0, 5, 10, 15]
    
    var totalPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercents[tipPercent])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amounPerson = grandTotal / peopleCount
        
        return amounPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount, ₽", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Сколько чаевых вы хотите оставить?")) {
                    Picker("Tippercentage", selection: $tipPercent) {
                        ForEach(0..<tipPercents.count) {
                            Text("\(self.tipPercents[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerson, specifier: "%.2f")₽")
                }
            }
            .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
