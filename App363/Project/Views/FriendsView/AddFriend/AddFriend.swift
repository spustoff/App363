//
//  AddFriend.swift
//  App363
//
//  Created by IGOR on 26/02/2024.
//

import SwiftUI

struct AddFriend: View {
    
    @StateObject var viewModel: FriendsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("New friend")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    VStack(spacing: 13) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(viewModel.friendName.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.friendName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.friendName)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        .padding(1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Age")
                                .foregroundColor(viewModel.friendAge.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.friendAge.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.friendAge)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        .padding(1)
                        
                        Text("Level of play")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(viewModel.levels, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentLevel = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(8)
                                        .padding(.horizontal)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(viewModel.currentLevel == index ? 0.3 : 0.1)))
                                })
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        
                        Button(action: {
                            
                            viewModel.friendLevel = viewModel.currentLevel
                            
                            viewModel.addFriend()
                            
                            viewModel.friendName = ""
                            viewModel.friendAge = ""
                            viewModel.currentLevel = ""
                            
                            viewModel.fetchFriends()

                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                        })
                        .opacity(viewModel.friendName.isEmpty || viewModel.friendAge.isEmpty || viewModel.currentLevel.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.friendName.isEmpty || viewModel.friendAge.isEmpty || viewModel.currentLevel.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddFriend(viewModel: FriendsViewModel())
}
