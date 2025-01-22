import SwiftUI

struct ShowCartViewButton: View {
    @Binding var showCartView: Bool
    
    var body: some View {
        Button(action: {
            showCartView = true
        }) {
            Image(systemName: "cart")
                .foregroundColor(.white)
        }
    }
    
    init(showCartView: Binding<Bool>) {
        _showCartView = showCartView
    }
}
