import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    
    func addToCart(product: Product) {
        products.append(product)
        print(product)
    }
    
    func removeFromCart(product: Product) {
        products.removeAll { $0.id == product.id }
    }
}
