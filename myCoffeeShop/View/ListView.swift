import SwiftUI


struct ListView: View {
    @State private var viewStyle: ViewStyle = .list
    
    var body: some View {
        List(products) { product in
            NavigationLink(
                destination: ProductDetail(product: product),
                label: {
                    ProductCard(card: product)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
            )
        }
    }
}
