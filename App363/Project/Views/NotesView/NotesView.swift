//
//  NotesView.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Notes")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                if viewModel.notes.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 40, weight: .regular))
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                        Text("Add your first note. It will definitely help in the games")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .padding(.bottom)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                                
                            }
                            
                        }, label: {
                            
                            Text("Add note")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 200, height: 50)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                   
                            ForEach(viewModel.notes, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedNote = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text((index.notDate ?? Date()).convertDate(format: "MMMM d"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.notTitle ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                            .lineLimit(2)
                                        
                                        Text(index.notText ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .semibold))
                                            .lineLimit(3)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(.white.opacity(0.1)))
                                })
                            }
                        }
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
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNotes(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            NotesDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    NotesView()
}
