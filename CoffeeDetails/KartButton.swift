//
//  KartButton.swift
//  CoffeeDetails
//
//  Created by mark me on 12/7/22.
//

import SwiftUI

struct KartButton: View {
    
    var numberOfProucts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
            
            if numberOfProucts > 0 {
                Text("\(numberOfProucts)")
                    .font(.caption2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0,saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}

struct Kart_Previews: PreviewProvider {
    static var previews: some View {
        KartButton(numberOfProucts: 1)
            
    }
}

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: UIImage
    var price: Int
    var ingredient: String
    
}

class KartManager: ObservableObject {
    @Published var products: [Product] = []
    @Published var total: Int = 0

    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter {$0.id != product.id}
        total -= product.price
    }
}
