//
//  ContentView.swift
//  chapter4
//
//  Created by Balázs Képli on 10/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                Text("Instant Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                Text("Get help from experts in 15 minutes")
            }
            HStack(alignment: .bottom, spacing: 10) {
                Image("user1")
                    .resizable()
                    .scaledToFit()
                Image("user2")
                    .resizable()
                    .scaledToFit()
                Image("user3")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            if verticalSizeClass == .compact {
                HSignUpButtonGroup()
            } else {
                VSignUpButtonGroup()
            }
            
        }
        .padding(.top, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
                .previewDisplayName("iPhone 13 Pro")
.previewInterfaceOrientation(.portrait)
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
.previewInterfaceOrientation(.portraitUpsideDown)
        }
        
        
    }
}

struct VSignUpButtonGroup: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(10)
            
            Button {
                
            } label: {
                Text("Log In")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.gray)
            .cornerRadius(10)
        }
    }
}

struct HSignUpButtonGroup: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(10)
            
            Button {
                
            } label: {
                Text("Log In")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.gray)
            .cornerRadius(10)
        }
    }
}
