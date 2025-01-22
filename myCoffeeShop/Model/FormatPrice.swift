import Foundation

func formatPrice(price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let number = NSNumber(value: price)
        return formatter.string(from: number) ?? "0.00 ₽"
    }
