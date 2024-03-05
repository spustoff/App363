//
//  RulesViewModel.swift
//  App363
//
//  Created by IGOR on 26/02/2024.
//

import SwiftUI

final class RulesViewModel: ObservableObject {

    @Published var combinations: [String] = ["Royal Flush", "Straight Flush", "Four of a Kind", "Full Hause", "Flash", "Straight", "Three of a kind", "Two pair", "Pair", "Hight card"]
    @Published var currentRules = ""
    
    @Published var views: [String] = ["Rules", "Combinations"]
    @Published var currentView = "Combinations"
    
    @Published var isDetail: Bool = false
    
}
