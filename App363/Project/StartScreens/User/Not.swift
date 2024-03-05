//
//  Not.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Don’t miss the important events")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top)
                        .frame(width: 350)
                        .multilineTextAlignment(.center)
                    
                    Text("Turn on notifications and always stay informed")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        
                    }, label: {
                        
                        Text("Enable notification")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                            .padding(.horizontal, 30)
                    })
                    
                    Button(action: {
                        
                        
                    }, label: {
                        
                        Text("Skip")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.1)))
                            .padding(.horizontal, 30)
                    })
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 280)
            }
        }
    }
}

#Preview {
    Not()
}
