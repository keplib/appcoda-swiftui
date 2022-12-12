//
//  ContentView.swift
//  chap04-exercise
//
//  Created by Balázs Képli on 12/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Instant Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("Get help from experts in 15 minutes")
                    .foregroundColor(.white)
                HStack (alignment: .bottom, spacing: 30) {
                    Image("student")
                    Image("tutor")
                }
                
                Text("Need help with problems? Register!")
                    .foregroundColor(.white)
                
                Spacer()
                
                ButtonsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonsView: View {
    var body: some View {
        
        VStack {
            Button {
                
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
            Button {
                
            } label: {
                Text("Log In")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }

    }
}
