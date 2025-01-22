import SwiftUI

struct CartView: View {
    @StateObject var cart: CartManager
    
    var body: some View {
        NavigationView {
            List(cart.products) { product in
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.headline)
                    Text(formatPrice(price: product.price))
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Shopping Cart")
            .navigationBarItems(trailing:
                Button(action: {
                    // Add logic for checkout here
                }) {
                    Text("Checkout")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: CartManager())
    }
}
