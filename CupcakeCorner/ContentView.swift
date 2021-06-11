//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Brian Wilson on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type.", selection: $order.order.type) {
                        ForEach(0..<Order.OrderStruct.types.count) {
                            Text(verbatim: Order.OrderStruct.types[$0])
                        }
                    }
                    Stepper(value: $order.order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.order.quantity)")
                    }
                } //Section
                Section {
                    Toggle(isOn: $order.order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if order.order.specialRequestEnabled {
                        Toggle(isOn: $order.order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        Toggle(isOn: $order.order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                } //Section
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Address")
                    }
                }
            } //Form
            .navigationBarTitle("Cupcake Corner")
        } //NavigationView
    } //View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
