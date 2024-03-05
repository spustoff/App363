//
//  R2.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Help in the game")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top)
                    
                    Text("Keep your clues with you")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Continue")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                            .padding()
                            .padding(.horizontal)
                    })
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 280)
            }
        }
    }
}

#Preview {
    R2()
}
