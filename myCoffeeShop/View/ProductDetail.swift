import SwiftUI

struct ProductDetail: View {
    let product: Product
    @EnvironmentObject var cart: CartManager
    
    var body: some View {
        ZStack {
            Color(mainBackgroundColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("\(product.name)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("\(formatPrice(price: product.price)) ₽")
                    .font(.title)
                    .foregroundColor(.green)
                if let image = product.image {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
                Text("\(product.description)")
                    .font(.custom("San Francisco", fixedSize: 20))
                    .foregroundColor(.white)
                
                // Add "Add to Cart" button
                Button(action: {
                    print(cart)
                    cart.addToCart(product: product)
                }) {
                    Text("Add to Cart")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
