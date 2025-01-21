import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let description: String
    let image: ImageResource?
    
    init(name: String, price: Double, description: String, image: ImageResource? = nil) {
        self.name = name
        self.price = price
        self.description = description
        self.image = image
    }
}

