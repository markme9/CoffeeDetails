//
//  CoffeeDetailsApp.swift
//  CoffeeDetails
//
//  Created by mark me on 12/7/22.
//

import SwiftUI

@main
struct CoffeeDetailsApp: App {
    
    @StateObject var kart = KartManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(kart)
        }
    }
}
