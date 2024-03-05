//
//  Reviews.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Rate us in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top)
                    
                    Text("Make the app better")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
