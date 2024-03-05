//
//  AddCards.swift
//  App363
//
//  Created by IGOR on 26/02/2024.
//

import SwiftUI

struct AddCards: View {
    
    @StateObject var viewModel: GamesViewModel
    @Environment(\.presentationMode) var router
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Adding cards")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                 
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.c1c.append(viewModel.currentColorC1)
                            viewModel.c1s.append(viewModel.currentSuitC1)
                            viewModel.c1v.append(viewModel.c1Value)
                            viewModel.c2c.append(viewModel.currentColorC2)
                            viewModel.c2s.append(viewModel.currentSuitC2)
                            viewModel.c2v.append(viewModel.c2Value)

                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        .opacity(viewModel.currentColorC1.isEmpty || viewModel.currentSuitC1.isEmpty || viewModel.c1Value.isEmpty || viewModel.currentColorC2.isEmpty || viewModel.currentSuitC2.isEmpty || viewModel.c2Value.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentColorC1.isEmpty || viewModel.currentSuitC1.isEmpty || viewModel.c1Value.isEmpty || viewModel.currentColorC2.isEmpty || viewModel.currentSuitC2.isEmpty || viewModel.c2Value.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            VStack {
                                
                                Text("\(viewModel.c1Value)")
                                    .foregroundColor(viewModel.currentColorC1.isEmpty ? Color.gray : Color(viewModel.currentColorC1))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Image(systemName: "\(viewModel.currentSuitC1)")
                                    .foregroundColor(viewModel.currentColorC1.isEmpty ? Color.gray : Color(viewModel.currentColorC1))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()
                            .frame(width: 120, height: 180)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            
                            VStack {
                                
                                Text("\(viewModel.c2Value)")
                                    .foregroundColor(viewModel.currentColorC2.isEmpty ? Color.gray : Color(viewModel.currentColorC2))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Image(systemName: "\(viewModel.currentSuitC2)")
                                    .foregroundColor(viewModel.currentColorC2.isEmpty ? Color.gray : Color(viewModel.currentColorC2))
                                    .font(.system(size: 32, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()
                            .frame(width: 120, height: 180)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        }
                    }
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Card 1 color")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.colors, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentColorC1 = index
                                        
                                    }, label: {
                                        
                                       Text(index)
                           
                                    })
                                }
                                                                
                            }, label: {
                                
                                if viewModel.currentColorC1.isEmpty {
                                    
                                    Circle()
                                        .fill(Color(.gray))
                                        .frame(width: 17, height: 17)
                                    
                                } else {
                                    
                                    Circle()
                                        .fill(Color(viewModel.currentColorC1))
                                        .frame(width: 17, height: 17)
                                }
                            })
                        }
                        .padding(.vertical, 4)
                        
                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Suit of cards")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.suits, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentSuitC1 = index
                                        
                                    }, label: {
                                        
                                        Image(systemName: "\(index)")
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentSuitC1.isEmpty {
                                    
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                } else {
                                    
                                    Image(systemName: "\(viewModel.currentSuitC1)")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                }
                            })
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            .padding(1)
                        }
                        .padding(.vertical, 4)

                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Card 1 Value")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            ZStack(content: {
                                
                                Text("A")
                                    .foregroundColor(viewModel.c1Value.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.c1Value.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.c1Value)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                            })
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            .padding(1)
                        }
                        .padding(.vertical, 4)

                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                    .padding(.top)
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Card 2 color")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.colors, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentColorC2 = index
                                        
                                    }, label: {
                                        
                                       Text(index)
                                    })
                                }
                                                                
                            }, label: {
                                
                                if viewModel.currentColorC2.isEmpty {
                                    
                                    Circle()
                                        .fill(Color(.gray))
                                        .frame(width: 17, height: 17)
                                    
                                } else {
                                    
                                    Circle()
                                        .fill(Color(viewModel.currentColorC2))
                                        .frame(width: 17, height: 17)
                                }
                            })
                        }
                        .padding(.vertical, 4)
                        
                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Suit of cards")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.suits, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentSuitC2 = index
                                        
                                    }, label: {
                                        
                                        Image(systemName: "\(index)")
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentSuitC2.isEmpty {
                                    
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                } else {
                                    
                                    Image(systemName: "\(viewModel.currentSuitC2)")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                }
                            })
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            .padding(1)
                        }
                        .padding(.vertical, 4)

                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Card 2 Value")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            ZStack(content: {
                                
                                Text("A")
                                    .foregroundColor(viewModel.c2Value.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.c2Value.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.c2Value)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                            })
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            .padding(1)
                        }
                        .padding(.vertical, 4)

                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                    .padding(.vertical)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddCards(viewModel: GamesViewModel())
}
