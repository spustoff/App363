//
//  AddNotes.swift
//  App363
//
//  Created by IGOR on 26/02/2024.
//

import SwiftUI

struct AddNotes: View {
    
    @StateObject var viewModel: NotesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("New note")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    VStack(spacing: 13) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Title")
                                .foregroundColor(viewModel.notTitle.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.notTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notTitle)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        .padding(1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(viewModel.notText.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.notText.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notText)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        .padding(1)
                        .padding(.bottom, 25)

                        Button(action: {
                                                        
                            viewModel.addNote()
                            
                            viewModel.notText = ""
                            viewModel.notTitle = ""
                            
                            viewModel.fetchNotes()
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                        })
                        .opacity(viewModel.notTitle.isEmpty || viewModel.notText.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.notTitle.isEmpty || viewModel.notText.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddNotes(viewModel: NotesViewModel())
}
