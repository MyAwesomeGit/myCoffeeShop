import SwiftUI

struct ProductDetail: View {
    let product: Product
    
    var body: some View {
        VStack {
            Text("Product Details")
                .font(.largeTitle)
            
            Text("Name: \(product.name)")
            Text("Price: $\(product.price)")
            Text("Description: \(product.description)")
            
            // Display the image if product.image is not nil
            if let image = product.image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()

        }
        .padding()
    }
}



struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(product: greenTea)
    }
}

