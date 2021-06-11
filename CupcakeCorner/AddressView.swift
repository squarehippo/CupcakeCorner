//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Brian Wilson on 6/9/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.order.name)
                TextField("StreetAddress", text: $order.order.streetAddress)
                TextField("City", text: $order.order.city)
                TextField("Zip", text: $order.order.zip)
            }
            Section {
                NavigationLink(
                    destination: CheckoutView(order: order)) {
                    Text("Checkout")
                }
            }
            .disabled(order.order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
