//
//  R3.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Compare and win friends")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top)
                    
                    Text("We will help you to assess opportunities correctly")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                     status = true
                        
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
    R3()
}
