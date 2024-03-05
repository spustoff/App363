//
//  NotesDetail.swift
//  App363
//
//  Created by IGOR on 26/02/2024.
//

import SwiftUI

struct NotesDetail: View {
    
    @StateObject var viewModel: NotesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text((viewModel.selectedNote?.notDate ?? Date()).convertDate(format: "MMMM d"))
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text(viewModel.selectedNote?.notTitle ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text(viewModel.selectedNote?.notText ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(width: 100, height: 50)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim2")))
                    })
                }
            }
            .padding()
        }
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
                    
                    Text("Your note will be irrevocably deleted from the app")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteNote(withNoteTitle: viewModel.selectedNote?.notTitle ?? "", completion: {
                            
                            viewModel.fetchNotes()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                        router.wrappedValue.dismiss()
                        
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
    NotesDetail(viewModel: NotesViewModel())
}
