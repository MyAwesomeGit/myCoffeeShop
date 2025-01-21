import SwiftUI

struct ProductCard: View {
    let card: Product
    
    var body: some View {
        HStack {
            if let imageResource = card.image {
                Image(imageResource)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } else {
                Image(systemName: card.name.lowercased())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(card.name)
                    .font(.headline)
                
                Text("$\(card.price)") //TODO: Add the price formatter
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(
            name: "Example Product",
            price: 123.45,
            description: "This is an example product.",
            image: ImageResource(name: "espresso", bundle: .main)
        )
        
        return ProductCard(card: product)
    }
}

