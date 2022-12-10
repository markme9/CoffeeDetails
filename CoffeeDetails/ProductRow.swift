//
//  ProductRow.swift
//  CoffeeDetails
//
//  Created by mark me on 12/7/22.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartManager: KartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(uiImage: product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .cornerRadius(15)
                
            
            Text(product.name)
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
        
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(Color.red)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                    
                }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("$ \(product.price)")
                    
                
            }
        
        
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product(name: "BlackCoffee", image: UIImage(named: "flowerCoffee")!, price: 0, ingredient: "This is thought to be due to coffee’s ability to preserve the function of the beta cells in your pancreas, which are responsible for producing insulin to regulate blood sugar levels. Plus, it’s rich in antioxidants and may affect insulin sensitivity, inflammation, and metabolism — all of which are involved in the development of type 2 diabetes."))
            .environmentObject(KartManager())
    }
}
