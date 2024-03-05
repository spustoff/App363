//
//  ContentView.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Game

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if status {
                
                VStack(spacing: 0, content: {
                    
                    TabView(selection: $current_tab, content: {
                        
                        GameView()
                            .tag(Tab.Game)
                        
                        RulesView()
                            .tag(Tab.Rules)
                        
                        FriendsView()
                            .tag(Tab.Friends)
                        
                        NotesView()
                            .tag(Tab.Notes)

                        SettingsView()
                            .tag(Tab.Settings)

                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                .ignoresSafeArea(.all, edges: .bottom)
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
