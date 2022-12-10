//
//  ContentView.swift
//  CoffeeDetails
//
//  Created by mark me on 12/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var productDetails = KartManager()
    
    @State var isPresented: Bool = false
    @State var numberOfProucts: Int = 0
    
    init() {
        let navigaion = UINavigationBar.appearance()
        navigaion.largeTitleTextAttributes = [.font: UIFont(name: "PlayfairDisplay-ExtraBold", size: 40) as Any]
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    ForEach(productDetails.products) { new in
                        CardView(coffee: new)
                        
                        
                    }
                    .toolbar {
                        NavigationLink {
                            KartView()
                            
                            
                        } label: {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "cart")
                                    .font(.headline)
                                
                                
                            }
                        }
                    }
                }
                
                .navigationTitle(Text("Order Coffee"))
                
                NavigationLink(destination: UserValues { item in
                    self.productDetails.products.append(item)
                }, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    
                        .frame(width: 40, height: 40)
                        .background(Color(UIColor.magenta))
                        .foregroundColor(Color.white)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                })
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(KartManager())
    }
}

