import SwiftUI

struct ContentView: View {
    @StateObject var cart = CartManager()
    @State private var selectedProduct: Product?
    @State private var viewStyle: ViewStyle = .list
    @State private var showCartView = false
    
    @State var testInt: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch viewStyle {
                case .list:
                    List(products) { product in
                        NavigationLink(
                            destination: ProductDetail(product: product),
                            label: {
                                ProductCard(card: product)
                                    .onTapGesture {
                                        self.selectedProduct = product
                                    }
                            }
                        )
                    }
                case .grid:
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)) {
                            ForEach(products) { product in
                                NavigationLink(
                                    destination: ProductDetail(product: product),
                                    label: {
                                        ProductCard(card: product)
                                            .onTapGesture {
                                                self.selectedProduct = product
                                            }
                                    }
                                )
                            }
                        }
                    }
                    
                }
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetail(product: product)
                
            }
            .navigationDestination(isPresented: $showCartView, destination: {CartView(cart: cart)})
            .navigationTitle("My Coffee Shop")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.viewStyle = self.viewStyle == .list ? .grid : .list
                    }) {
                        HStack {
                            Image(systemName: self.viewStyle == .list ? "rectangle.grid.2x2" : "list.bullet")
                                .foregroundColor(.white)
                            Spacer()
                            ShowCartViewButton(showCartView: $showCartView)
                        }
                        .padding()
                        .background(Color(mainBackgroundColor))
                        .cornerRadius(90)
                    }
                }
            }
        }
        .environmentObject(cart)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
