//
//  ContentView.swift
//  PickerPractice
//
//  Created by Johnathan Lee on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var locationSelection = "Los Angeles"
    @State var mealSelection = "Mac n Cheese"
    @State var mealTime = Date()
    
    var locationList = ["San Francisco", "Los Angeles", "San Diego","Denver","New York City","Portland","Seatle","Boston"]
    var mealList = ["Mac n Cheese","Pizza","Soup","Salad","Rice","Sushi","Sandwich","Coffee","Tea","Soda","Dessert"]
    
    var body: some View {
        VStack {
            Text("Ottimo Ristorante")
                .font(.largeTitle)
            
            HStack {
                Text("Location:")
                
                Picker("Location", selection: $locationSelection) {
                    ForEach(locationList, id: \.self) {
                        loc in
                        Text(loc).tag(loc)
                    }
                }.pickerStyle(.menu)
                
            }
            
            VStack {
                Text("Order: ")
                
                Picker("Order", selection: $mealSelection) {
                    ForEach(mealList, id: \.self) {
                        meal in
                        Text(meal).tag(meal)
                    }
                }.pickerStyle(.wheel)
            }
            
            VStack {
                Text("Pick Time")
                
                DatePicker(
                    "",
                    selection: $mealTime,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.wheel)
            }
            
            Button {
                locationSelection = locationList.randomElement()!
                mealSelection = mealList.randomElement()!
                mealTime = Date()
                print("Location: \(locationSelection)")
                print("Order: \(mealSelection)")
                print("Time: \(mealTime)")
            } label: {
                Text("Pick for me")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
