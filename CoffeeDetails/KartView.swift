//
//  KartView.swift
//  CoffeeDetails
//
//  Created by mark me on 12/7/22.
//

import SwiftUI

struct KartView: View {
    
    @EnvironmentObject var kartManger: KartManager
    
    var body: some View {
        ScrollView {
            if kartManger.products.count > 0 {
                ForEach(kartManger.products, id: \.id) {
                    product in
                    ProductRow(product: product)
                
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                        
                    Text("₹ \(kartManger.total).00")
                        .fontWeight(.bold)
                }.padding()
                
            }else {
                Text("Your cart is empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct KartView_Previews: PreviewProvider {
    static var previews: some View {
        KartView()
            .environmentObject(KartManager())
    }
}
