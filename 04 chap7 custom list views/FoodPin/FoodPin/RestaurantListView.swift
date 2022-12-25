//
//  ContentView.swift
//  FoodPin
//
//  Created by Balázs Képli on 17/12/2022.
//

import SwiftUI

struct RestaurantListView: View {
    
    var restaurantNames = ["Cafe Deadend","Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    
    var restaurantImages = ["cafedeadend", "homei", "teakha","cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)

    var body: some View {
        
        List {
            ForEach(restaurantNames.indices, id:\.self) { index in
                BasicTextImageRow(name: restaurantNames[index], type: restaurantTypes[index], location: restaurantLocations[index], isFavorite: $restaurantIsFavorites[index])
            
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        
        RestaurantListView()
            .preferredColorScheme(.dark)
    }
}

struct BasicTextImageRow: View {
    var name: String
    var type: String
    var location: String
    
    @State private var showOptions = false
    @State private var showError = false
    @Binding var isFavorite: Bool
    
    
    var body: some View {
        HStack (alignment: .top, spacing: 20) {
            Image("barrafina")
                .resizable()
                .frame( width: 120, height: 118)
                .cornerRadius(20)
            VStack (alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                Text(location)
                    .font(.system(.body, design: .rounded))
                Text(type)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
                
               
            }
            .padding(.leading, 20)
            
            if isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                            .default(Text("Reserve a table")) {
                                self.showError.toggle()

                            },
                            .default(Text("Mark as favorite")) {
                                self.isFavorite.toggle()
                            },
                            .cancel()
                        ])
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not yet available"),
                  message: Text("Sorry, this feature is nnot available yet."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )

        }
        
    }
}

struct FullImageRow: View {
    
    var name: String
    var type: String
    var location: String
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("barrafina")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                Text(location)
                    .font(.system(.body, design: .rounded))
                Text(type)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
                Text(String(showOptions))
            }
            .padding(.horizontal)
            .foregroundColor(.gray)
        }
        .onTapGesture {
            showOptions.toggle()
            print(String(showOptions))
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                            .default(Text("Reserve a table")) {
                                self.showError.toggle()
                                
                            },
                            .default(Text("Mark as favorite")) {
                                
                            },
                            .cancel()
                        ])
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not yet available"),
                  message: Text("Sorry, this feature is nnot available yet."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )

        }
    }
}
