import Foundation
import SwiftUI

let espressoWithImage = Product(
    name: "Espresso",
    price: 5.99,
    description: "• Made from expertly roasted, high-quality Arabica beans • Brewed to perfection using our state-of-the-art espresso machine • Rich, bold flavors with notes of chocolate and caramel",
    image: ImageResource(name: "espresso", bundle: .main)
)

let greenTea = Product(
    name: "Green tea",
    price: 6.99,
    description: "• Light, crisp flavor with subtle grassy notes • High in antioxidants and nutrients • Low in caffeine compared to other teas • Made from young tea leaves that are quickly heated to preserve freshness • Can be enjoyed hot or chilled for a refreshing iced tea",
    image: ImageResource(name: "greentea", bundle: .main)
)
let products = [
    espressoWithImage,
    greenTea,
    Product(name: "Water", price: 79.99, description: "Clean water"),
    
]
