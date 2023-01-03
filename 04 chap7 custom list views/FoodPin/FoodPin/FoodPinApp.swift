//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Balázs Képli on 17/12/2022.
//

import SwiftUI

@main
struct FoodPinApp: App {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 218, green: 96, blue: 51), .font: UIFont(name:"ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(red: 218, green: 96, blue: 51), .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
    }
}
