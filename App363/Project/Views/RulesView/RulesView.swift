//
//  RulesView.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct RulesView: View {
    
    @StateObject var viewModel = RulesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Rules")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                HStack {
                    
                    ForEach(viewModel.views, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentView = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 25)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(viewModel.currentView == index ? 0.3 : 0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 25)
                .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.1)))
                .padding(.bottom)
                
                if viewModel.currentView == "Rules" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            Text("The essence of poker")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Despite several popular varieties of poker, the goal of each game (game) is as follows: Collect the largest combination compared to other players at the table. Win all bets before the cards are revealed or when all other players pass. It is important for beginners to immediately understand that the first does not automatically mean the second, i.e. Having the best combination in your hands, but having lost your bets, you can be left with nothing, while a player with a worse combination, but an excellent strategy for a particular table, will emerge victorious and take the pot. By “specific table” we mean the predominance of players with an aggressive or, conversely, restrained playing style, which determines the passage of most trades and the average pot played.")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Basics")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Currently, the most common type of poker is Texas hold’em, so everything listed below will relate to this particular variety. All terms, both slang and official, are not translated into Russian, but are indicated in tracing paper (ex. Check - Check, not “Check”). Poker uses a standard deck of playing cards consisting of 52 cards. Card order: 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A. For each game (series of games), a new sealed playing deck is used. The deck is replaced for any damage in which players can identify a specific card or cards. Players at the table receive 2 personal cards, and 5 community cards are laid out on the table in several stages. The player's goal is to either defeat his opponents when revealing personal cards after 5 community cards have been laid out, or to have all other players fold their cards at any stage. When opening cards, the player who has the best combination of 5 cards out of 7 cards (2 personal and 5 public) wins. It does not matter how many personal cards are used to collect a combination.")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(alignment: .leading, spacing: 15) {
                            
                            ForEach(viewModel.combinations, id: \.self) { index in

                                Button(action: {
                                    
                                    viewModel.currentRules = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 30, height: 30)
                                            
                                            Text(index)
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white.opacity(0.2))
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.1))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                    }
                                            
                                })
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDetail ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                    }
                
                VStack {

                    Text(viewModel.currentRules)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding()
                        .padding(.bottom)
                    
                    Image(viewModel.currentRules)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 220)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 17).fill(Color("prim")))
                        
                    })
                    .padding(.top, 65)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isDetail ? 0 : UIScreen.main.bounds.height)

            }
        )
    }
}

#Preview {
    RulesView()
}
