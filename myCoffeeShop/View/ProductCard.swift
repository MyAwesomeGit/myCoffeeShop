import SwiftUI

struct ProductCard: View {
    let card: Product
    
    var body: some View {
        ZStack {
            Color(mainBackgroundColor)
                                .edgesIgnoringSafeArea(.all)
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
                        .foregroundColor(mainFontColor)
                    
                    Text("\(formatPrice(price: card.price)) ₽")
                        .foregroundColor(.green)
                }
                Spacer()
            }.cornerRadius(90)
            .padding()
            
        }
    }
}


struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(
            name: "Espresso",
            price: 123.50,
            description: "This is an example product.",
            image: ImageResource(name: "espresso", bundle: .main)
        )
        
        return ProductCard(card: product)
    }
}
