//
//  ContentView.swift
//  FoodPin
//
//  Created by Balázs Képli on 17/12/2022.
//

import SwiftUI

struct RestaurantListView: View {
    
    @State var restaurants = [Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isFavorite: false), Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isFavorite: false), Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false), Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false), Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false), Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false), Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false), Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false), Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false), Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false), Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false), Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false), Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false), Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false), Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false), Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false), Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false), Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false), Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false), Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite:false), Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)]
    
//    var restaurantNames = ["Cafe Deadend","Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//
//
//    var restaurantImages = ["cafedeadend", "homei", "teakha","cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
//
//
//    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
//
//    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
//
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)

    var body: some View {
        
        List {
            ForEach(restaurants.indices, id:\.self) { index in
                BasicTextImageRow(restaurant: $restaurants[index])
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        .tint(.green)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .tint(.orange)
                    }
            }
            .onDelete(perform: { IndexSet in
                restaurants.remove(atOffsets: IndexSet)
            })
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
//    var name: String
//    var type: String
//    var location: String
//    @Binding var isFavorite: Bool
    
    
    // MARK: - Binding
    @Binding var restaurant: Restaurant
    
    // MARK: - State Variables
    @State private var showOptions = false
    @State private var showError = false
    
    
    
    var body: some View {
        HStack (alignment: .top, spacing: 20) {
            Image("barrafina")
                .resizable()
                .frame( width: 120, height: 118)
                .cornerRadius(20)
            VStack (alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.type)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
                
               
            }
            .padding(.leading, 20)
            
            if restaurant.isFavorite {
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .contextMenu{
            
            Button {
                self.showError.toggle()
            } label: {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button {
                self.restaurant.isFavorite.toggle()
            } label: {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            
            Button {
                self.showOptions.toggle()
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }

            }
            
        }
//        .onTapGesture {
//            showOptions.toggle()
//        }
//        .actionSheet(isPresented: $showOptions) {
//            ActionSheet(title: Text("What do you want to do?"),
//                        message: nil,
//                        buttons: [
//                            .default(Text("Reserve a table")) {
//                                self.showError.toggle()
//
//                            },
//                            .default(Text(restaurant.isFavorite ? "Remove from favorites" :"Mark as favorite")) {
//                                self.restaurant.isFavorite.toggle()
//                            },
//                            .cancel()
//                        ])
//        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not yet available"),
                  message: Text("Sorry, this feature is nnot available yet."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )

        }
        .sheet(isPresented: $showOptions) {
            
        } content: {
            let defaultText = "Just checking in at \(restaurant.name)"
                                
            if let imageToShare = UIImage(named: restaurant.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
        
    }
}

struct FullImageRow: View {
    
    var name: String
    var type: String
    var location: String
    
    @State private var showOptions = false
    @State private var showError = false
    @Binding var isFavorite: Bool
     
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("barrafina")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            HStack(alignment: .top) {
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
                
                if isFavorite {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                }
            }
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
                            .default(Text(isFavorite ? "Remove from favorites" :"Mark as favorite")) {
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
