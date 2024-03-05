//
//  SettingsView.swift
//  App363
//
//  Created by IGOR on 25/02/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                VStack {
                
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/c9443bf6-3dde-41b4-9db6-8d86395d2026") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack {
                            
                            
                            HStack {
                                
                                Image(systemName: "doc.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(8)
                                    .background(Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 30, height: 30))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.2))
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(8)
                                    .background(Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 30, height: 30))
                                
                                Text("Rate App")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.2))
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
