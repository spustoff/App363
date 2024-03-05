//
//  GameView.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GamesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Game")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                if viewModel.c1c.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("cards")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 260)
                        
                        Text("Add cards to your game")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.top, 40)
                        
                        Text("Start your game by adding cards")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add cards")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 190, height: 50)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                        })
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    VStack {
                        
                        HStack {
                            
                            VStack {
                                
                                Text("\(viewModel.c1v)")
                                    .foregroundColor(viewModel.c1c.isEmpty ? Color.gray : Color(viewModel.c1c))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Image(systemName: "\(viewModel.c1s)")
                                    .foregroundColor(viewModel.c1c.isEmpty ? Color.gray : Color(viewModel.c1c))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()
                            .frame(width: 120, height: 180)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            
                            VStack {
                                
                                Text("\(viewModel.c2v)")
                                    .foregroundColor(viewModel.c2c.isEmpty ? Color.gray : Color(viewModel.c2c))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Image(systemName: "\(viewModel.c2s)")
                                    .foregroundColor(viewModel.c2c.isEmpty ? Color.gray : Color(viewModel.c2c))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()
                            .frame(width: 120, height: 180)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        }
                        
                        Text("You've added your cards")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.top, 40)
                            .padding(8)
                        
                        Text("Pick the outcome of the game. Win or lose")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.c1c.removeAll()
                                viewModel.c1s.removeAll()
                                viewModel.c1v.removeAll()
                                viewModel.c2c.removeAll()
                                viewModel.c2s.removeAll()
                                viewModel.c2v.removeAll()
                                
                            }, label: {
                                
                                Text("Win")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(width: 140, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                            })
                            
                            Button(action: {
                                
                                viewModel.c1c.removeAll()
                                viewModel.c1s.removeAll()
                                viewModel.c1v.removeAll()
                                viewModel.c2c.removeAll()
                                viewModel.c2s.removeAll()
                                viewModel.c2v.removeAll()
                                
                            }, label: {
                                
                                Text("Lose")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(width: 140, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim2")))
                            })
                        }
                        .padding(.top, 30)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCards(viewModel: viewModel)
        })
    }
}

#Preview {
    GameView()
}
