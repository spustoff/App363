//
//  FriendsView.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct FriendsView: View {
    
    @StateObject var viewModel = FriendsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Rules")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                if viewModel.friends.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 40, weight: .regular))
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                        Text("You have no friends added")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .padding(.bottom)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                                
                            }
                            
                        }, label: {
                            
                            Text("Add friend")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 200, height: 50)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                   
                            ForEach(viewModel.friends, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedFriend = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(spacing: 5) {
                                        
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Circle().fill(.white.opacity(0.2)))
                                            .padding()
                                        
                                        Text(index.friendName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Text("\(index.friendAge ?? "") years")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Text(index.friendLevel ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(5)
                                            .padding(.horizontal)
                                            .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                                            .padding()
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(.white.opacity(0.1)))
                                })
                            }
                        })
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(Color.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                    })
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchFriends()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddFriend(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Confirming deletion")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Your friend will be irrevocably deleted from the app")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        
                        CoreDataStack.shared.deleteFriend(withFriendName: viewModel.selectedFriend?.friendName ?? "", completion: {
                            
                            viewModel.fetchFriends()
                        })
                                                
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.8)))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    FriendsView()
}
