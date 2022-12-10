//
//  CardView.swift
//  CoffeeDetails
//
//  Created by mark me on 12/7/22.
//

import SwiftUI


struct CardView: View {
    
    @EnvironmentObject var kart: KartManager
    var coffee: Product
   
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            VStack(alignment: .leading) {
                Image(uiImage: coffee.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .cornerRadius(5)
                    
                
                HStack {
                    Text(coffee.name)
                        .font(.headline)
                        .foregroundColor(Color.purple)
                        
                    Spacer()
                    
                    Text("$ \(coffee.price)")
                        .font(.headline)
                        .foregroundColor(Color.purple)
                    
                }
                Text(coffee.ingredient)
                    .padding(.top, 1)
                    .font(.caption)
                    .foregroundColor(Color.black)
                
                
            }
            .padding()
            .background(Rectangle())
            .foregroundColor(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding([.leading, .trailing])
            
            Button {
                kart.addToCart(product: coffee)
                
                    
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    .frame(width: 30, height: 30)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 45)
                    .padding(.top, 30)
                
            }
            
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(coffee: Product(name: "BlackCoffee", image: UIImage(named: "flowerCoffee")!, price: 7, ingredient: "This is thought to be due to coffee’s ability to preserve the function of the beta cells in your pancreas, which are responsible for producing insulin to regulate blood sugar levels. Plus, it’s rich in antioxidants and may affect insulin sensitivity, inflammation, and metabolism — all of which are involved in the development of type 2 diabetes."))
            
    }
}
