//
//  Order.swift
//  CupcakeCorner
//
//  Created by Brian Wilson on 6/9/21.
//

import Foundation

class Order: ObservableObject {
    @Published var order: OrderStruct
    
    init() {
        order = OrderStruct()
    }
    
    struct OrderStruct: Codable {
        static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
        
        var type = 0
        var quantity = 3
        var extraFrosting = false
        var addSprinkles = false
        
        var name = ""
        var streetAddress = ""
        var city = ""
        var zip = ""
        
        var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        
        var hasValidAddress: Bool {
            let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedStreet = streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedCity = city.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedZip = zip.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmedName.isEmpty ||
                trimmedStreet.isEmpty ||
                trimmedCity.isEmpty ||
                trimmedZip.isEmpty {
                return false
            }
            return true
        }
        
        var cost: Double {
            var cost = Double(quantity) * 2
            cost += (Double(type) / 2)
            
            if extraFrosting {
                cost += Double(quantity)
            }
            if addSprinkles {
                cost += Double(quantity) / 2
            }
            return cost
        }
    }
}


