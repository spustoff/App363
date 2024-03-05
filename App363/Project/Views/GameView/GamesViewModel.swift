//
//  GamesViewModel.swift
//  App363
//
//  Created by IGOR on 26/02/2024.
//

import SwiftUI
import CoreData

final class GamesViewModel: ObservableObject {

    @Published var c1Value: String = ""
    @Published var c2Value: String = ""
    @Published var c1Suit: String = ""
    @Published var c2Suit: String = ""
    @Published var c1Color: String = ""
    @Published var c2Color: String = ""
    
    @AppStorage("c1v") var c1v = ""
    @AppStorage("c1s") var c1s = ""
    @AppStorage("c1c") var c1c = ""
    @AppStorage("c2v") var c2v = ""
    @AppStorage("c2s") var c2s = ""
    @AppStorage("c2c") var c2c = ""

    @Published var colors: [String] = ["black", "red"]
    @Published var currentColorC1 = ""
    @Published var currentColorC2 = ""
    
    @Published var suits: [String] = ["suit.heart.fill", "suit.club.fill", "suit.diamond.fill", "suit.spade.fill"]
    @Published var currentSuitC1 = ""
    @Published var currentSuitC2 = ""

    @Published var isAdd: Bool = false
    @Published var isAddPlan: Bool = false
    @Published var isDetail: Bool = false

    @Published var cards: [GameModel] = []
    @Published var selectedCard: GameModel?

    func addFriend() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GameModel", into: context) as! GameModel

        loan.c1Value = c1Value
        loan.c2Value = c2Value
        loan.c1Suit = c1Suit
        loan.c2Suit = c2Suit
        loan.c1Color = c1Color
        loan.c2Color = c2Color

        CoreDataStack.shared.saveContext()
    }
    
    func fetchFriends() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GameModel>(entityName: "GameModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.cards = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.cards = []
        }
    }
}
