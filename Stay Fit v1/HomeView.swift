//
//  HomeView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 03/04/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack {
            
            Image("background")
            
            VStack {
                
                // QUOTE
                Text("Our bodies communicate to us clearly and specifically, if we are willing to listen to them")
                    .foregroundColor(.white)
                    .bold()
                    .font(.title2)
                    .padding()
                    .padding(.top, 100)
                
                // AUTHOR
                Text("- Shakti Gawain")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding()
                    .padding(.leading, 200)
                
                Spacer()
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
