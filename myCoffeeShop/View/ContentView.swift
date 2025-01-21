import SwiftUI


struct ContentView: View {
    @State private var selectedProduct: Product?
    @State private var viewStyle: ViewStyle = .list
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("My Coffee Shop")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.viewStyle = self.viewStyle == .list ? .grid : .list
                    }) {
                        Text(self.viewStyle == .list ? "Grid" : "List")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
