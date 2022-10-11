//
//  ContentView.swift
//  H4X0R News
//
//  Created by Michaela Beyer on 2022-10-11.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color.green
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack (alignment : .leading) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(LinearGradient(colors: [.green.opacity(0.3), .pink.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    
                    List(networkManager.posts) { post in
                        NavigationLink(destination: DetailView(url: post.url)) {
                            HStack {
                                Text(String(post.points))
                                    .font(.system(size: 20))
                                Text(post.title)
                                    .fontWeight(.bold)
                                    .font(.system(size: 19))
                            }
                            
                            
                        }
                    }
                    
                    
                    Spacer()
                    
                }
                .navigationTitle("HACKER NEWS")
                .font(.title2)
            }
            .onAppear{
                self.networkManager.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


